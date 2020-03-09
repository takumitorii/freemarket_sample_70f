class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :ancestry)
  end
end
