class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :check_user_is_admin, except: :index

  def index
    @brands = Brand.all
  end

  def show; end

  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit; end

  def create
    @brand = Brand.new(brand_params)
    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, flash: { success: t("brand.create_success") } }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to @brand, flash: { success: t("brand.update_success") } }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url, flash: { success: t("brand.delete_success") } }
      format.json { head :no_content }
    end
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name)
  end
end
