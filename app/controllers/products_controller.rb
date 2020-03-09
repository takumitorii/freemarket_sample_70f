class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
    redirect_to root_path
  end

  def show
    @product = Product.new
    @products = Product.find(params[:id])
  end
end