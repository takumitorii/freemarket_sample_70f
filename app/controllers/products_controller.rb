class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def new
    @product = Product.new
    @images = ProductImage.new
    @category = Category.new
    @brand = Brand.new
    @shipping = ShippingInfo.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      params[:product_images]['image'].each do |a|
        @images = @product.product_images.create!(image: a)
      end
      redirect_to product_path(@product)
    else
      redirect_to new_product_path
    end
  end

  def show
    @products = Product.find(params[:id])
    @grandchild = Category.find(@products.category_id)
    @child = @grandchild.parent
    @parent = @child.parent if @child
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

  def edit
    @product = Product.find(params[:id])
    @category = Category.find(params[:id])
    @brand = Brand.find(params[:id])
    gon.product = @product
    gon.product_images = @product.product_images
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
      :product_image_id,
      product_images_attributes: [{image: []}, :product_id],
      category_attributes: [:category_name], 
      brand_attributes: [:name],
      shipping_info_attributes: [:shipping_cost, :shipping_days, :prefecture_id]
    ).merge(seller_id: current_user.id, category_id: current_user.id, brand_id: current_user.id, shipping_info_id:current_user.id )

  end

end

