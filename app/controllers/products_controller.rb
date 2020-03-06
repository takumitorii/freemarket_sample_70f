class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.new
    @products = Product.find(params[:id])
  end
end
