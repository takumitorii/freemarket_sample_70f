class CategoriesController < ApplicationController

  def index
    @products = Product.all
    @categories = Category.all
    # @parents = Category.all.order("id ASC").limit(1)
  end

  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
  end

  def show
    # @product = Product.find(params[:id])
    # @category = Category.find(params[:id])
    # @parents = Category.where(ancestry: nil)
    @grandchild = Category.find(params[:id])
    @child = @grandchild.parent
    if @child
      @parent = @child.parent
    end
    @products = Product.where(category_id: "#{@grandchild.id}")
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :ancestry)
  end
end
