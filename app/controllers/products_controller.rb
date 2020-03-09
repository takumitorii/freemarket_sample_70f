class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
    @parents = Category.all.order("id ASC").limit(1)
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to root_path
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
    params.require(:product).permit(:name, :price, :description, :status).merge(seller_id: current_user.id)
  end

end

