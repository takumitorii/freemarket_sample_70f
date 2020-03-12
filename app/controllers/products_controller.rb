class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to root_path
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
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :status).merge(seller_id: current_user.id)
  end

end

