class ProductsController < ApplicationController
  def index
  end

  def show
    @top = Top.find(params[:id])
  end
end
