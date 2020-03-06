class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    
  end

  def show
    @product = Product.new
    @products = Product.find(params[:id])
  end
end
