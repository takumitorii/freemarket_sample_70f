class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @product = Product.new
    @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
          @category_parent_array << parent.name
      end
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

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

 # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :status).merge(seller_id: current_user.id)
  end

end

