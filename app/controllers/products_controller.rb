class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :category_edit, only: [:edit,:update]
  
  def new
    @product = Product.new
    @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
    @images = Image.new
    @category = Category.new
    @brand = Brand.new
  end

  def create
    @product = Product.new(product_params)
    if params[:images]
      if @product.save
        params[:images]['image'].each do |a|
          @images = @product.images.create(image: a)
        end
        @product.judgment = 1
        @product.save
        flash[:notice] = "出品が完了しました！"
        redirect_to product_path(@product)
      else
        flash[:error] = "入力に誤りがあります。もう一度入力してください。"
        redirect_to new_product_path
      end
    else
      flash[:error] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to new_product_path
    end
  end

  def show
    @products = Product.find(params[:id])
    @tax_in_price = @products.price * 1.1
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
    @product = Product.find(params[:id])
    @brand = Brand.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_update_params)
      redirect_to product_path(@product)
    else
      flash[:error] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to edit_product_path(@product)
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_children = Category.find_by(name: params[:parent_name], ancestry: nil).children
  end

 # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private

  def category_edit
    parent_category = Category.find(Product.find(params[:id]).category_id).root
    @category_parent_array = [parent_category.name, "---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name if parent_category != parent
      end
    @child_name = Category.find(Product.find(params[:id]).category_id).parent.name
    @category_child_array =Category.find(Product.find(params[:id]).category_id).root.children
    @grandchild_name = Category.find(Product.find(params[:id]).category_id).name
    @category_grandchild_array = Category.find(Product.find(params[:id]).category_id).parent.children
  end


  
  def product_params

    params.require(:product).permit(
      :name, 
      :price, 
      :description, 
      :status,
      :size,
      :judgment,
      :images_id,
      :category_id,
      :cost, :days, :prefecture_id,
      images_attributes: [{image: []}, :product_id, :id, :image],
      category_attributes: [:name], 
      brand_attributes: [:name]
    ).merge(
      user_id: current_user.id, 
    )
  end
  
  def product_update_params
    params.require(:product).permit(
      :name, 
      :price, 
      :description, 
      :status,
      :size,
      :judgment,
      :category_id,
      :cost, :days, :prefecture_id,
      images_attributes: [{image: [:image]}, :_destroy, :product_id, :id],
      category_attributes: [:name], 
      brand_attributes: [:name]
    ).merge(
      user_id: current_user.id, 
    )
  end
end

