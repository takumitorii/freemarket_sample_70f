class TopsController < ApplicationController
  def index
    @products = Product.all.includes(:images)
  end
end
