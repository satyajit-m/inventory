class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy storage]
  before_action :check_user_is_admin, except: :index

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, flash: { success: t("category.create_success") } }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, flash: { success: t("category.update_success") } }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, flash: { success: t("category.delete_success") } }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id]) if params[:id].present?
  end

  def category_params
    params.require(:category).permit(:name, :min_qty, :buffer, :id)
  end
end
