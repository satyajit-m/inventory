class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy assign_user remove_user]
  before_action :check_storage, only: :assign
  before_action :authenticate_user!
  before_action :check_user_is_admin

  def index
    @items = Item.all
  end

  def show; end

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, flash: { success: t("item.create_success") } }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, flash: { success: t("item.create_success") } }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @item.users.present?
      redirect_to items_path, flash: { warning: t("item.user_present") }
      return
    end
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, flash: { success: t("item.delete_success") } }
      format.json { head :no_content }
    end
  end

  def assign_user
    @storage = @item.storage
    user = User.find(params[:item][:user_ids])
    if @item.users.include?(user)
      redirect_to items_path, flash: { warning: t("item.already_assigned") }
      return
    end
    if @storage.qty.zero?
      redirect_to items_url, flash: { warning: t("item.stock_empty") }
    else
      @storage.decrement(:qty)
      Notification.low_buffer(@storage, @item) if @storage.qty < @storage.max_buffer
      p @storage.save(validate: false)
      p @storage
      @item.users << user
      # @item.users << User.find(params[:item][:user_ids])
      redirect_to items_url
    end
  end

  def remove_user
    p params
    user = User.find(params[:user])
    item = Item.find(params[:id])
    storage = item.storage
    p storage
    if @item.users.delete(user)
      storage.increment!(:qty)
      redirect_to @item, flash: { success: t("item.remove_user_success") }
    else
      redirect_to @item, flash: { danger: t("item.remove_user_unsuccess") }
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :brand_id, :category_id, :status, :notes, :doc, user_ids: [])
  end

  def check_storage
    @item = Item.find(params[:id])
    redirect_to items_path, flash: { danger: t("item.not_listed") } if @item.storage.nil?
  end
end
