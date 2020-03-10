class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
    @parents = Category.all.order("id ASC").limit(1)
  end

  def new
    @product = Product.new
    @images = ProductImage.new
    @category = Category.new
    @brand = Brand.new
  end

  def create
    @product = Product.new(product_params)
    # binding.pry
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @products = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  def edit
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
  end

  private
  def product_params
    params.require(:product).permit(
      :name, :price, 
      :description, 
      :status, 
      product_images_attributes: [:image, :product_id],
      category_attributes: [:category_name], 
      brand_attributes: [:name]
    ).merge(seller_id: current_user.id, category_id: current_user.id, buyer_id: current_user.id, brand_id: current_user.id, product_image_id:current_user.id )
  end

end

