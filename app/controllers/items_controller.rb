class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy assign_user remove_user created]
  before_action :authenticate_user!
  before_action :check_user_is_admin, except: :index

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
          Item.check_qty(@item)
          format.html { redirect_to created_item_path(@item), flash: { success: t("item.create_success") } }
        else
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
    end
  end

  def update
    new_item = item_params
    new_item[:user_id] = nil if new_item[:status] == "false"
    respond_to do |format|
      if @item.update(new_item)
        format.html { redirect_to @item, flash: { success: t("item.update_success") } }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @item.user.present?
      redirect_to items_path, flash: { warning: t("item.user_present") }
    else
      @item.destroy
      respond_to do |format|
        format.html { redirect_to items_url, flash: { success: t("item.delete_success") } }
        format.json { head :no_content }
      end
    end
  end

  def created; end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :brand_id, :category_id, :user_id, :status, :notes, :doc)
  end

end
