class CategoriesController < ApplicationController

  def index
    @products = Product.all
    @categories = Category.all
    @parents = Category.where(ancestry: nil)
  end

  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
  end

  def show
    @grandchild = Category.find(params[:id])
    @child = @grandchild.parent
    if @child
      @parent = @child.parent
      if  @parent
        @products = Product.where(category_id: "#{@grandchild.id}")
      else
        @children = @grandchild.children
        @products = []
        for child in @children.ids do
          product = Product.where(category_id: "#{child}")
          if product != []
            @products << product
          end
        end
      end
    else
      @grandchildren = @grandchild.indirects
      @products = []
      for grandchild in @grandchildren.ids do
        product = Product.where(category_id: "#{grandchild}")
        if product != []
          @products << product
        end
      end
    end
  end

  private
  def category_params
    params.require(:category).permit(:category_name, :ancestry)
  end
end
