class IssuesController < ApplicationController
  before_action :set_issue, only: %i[show edit update destroy mark_resolved]
  before_action :check_admin, only: %i[new edit create]

  def index
    @issues = @current_user.admin ? Issue.all : Issue.where(user: current_user)
  end

  def show
    redirect_to issues_path, flash: { warning: t("issue.access_unauthorized") } if @issue.user == current_user && !current_user.admin 
  end

  def new
    @issue = Issue.new
  end

  def edit; end

  def create
    @issue = Issue.new(issue_params)
    @issue.user_id = current_user.id
    if Issue.issue_exist(@issue) == 1
      redirect_to issues_path, flash: { warning: t("issue.already_exist") }
      return
    end
    respond_to do |format|
      if @issue.save
        Notification.issue_new(@issue)
        format.html { redirect_to @issue, flash: { success: t("issue.create_success") } }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, flash: { success: t("issue.delete_success") } }
      format.json { head :no_content }
    end
  end

  def mark_resolved
    if @issue.update(resolved: true)
      Notification.issue_resolved(@issue)
      redirect_to issues_path, flash: { success: t("issue.resolved") }
    end
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:user_id, :item_id, :details)
  end

  def check_admin
    redirect_to issues_path, flash: { danger: t("issue.create_unauthorized") } if current_user.admin
  end

end
