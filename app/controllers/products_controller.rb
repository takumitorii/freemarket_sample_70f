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
    if @product.save
      params[:images]['image'].each do |a|
        @images = @product.images.create(image: a)
      flash[:notice] = "出品が完了しました！"
      end
      @product.judgment = 1
      @product.save
      redirect_to product_path(@product)
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
      render :edit
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    @category_children = Category.find_by(name: params[:parent_name], ancestry: nil).children
  end

 # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    @category_grandchildren = Category.find_by(name: params[:child_id]).children
  end

  def get_category_id_children
    @children_ids = Category.find(Product.find(params[:id]).category_id)
  end
  private

  def category_edit
    parent_category = Category.find(Product.find(params[:id]).category_id).root
    @category_parent_array = [parent_category.name, "---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name if parent_category != parent
      end
    child_category = Category.find(Product.find(params[:id]).category_id).parent
    @category_child_array = [child_category.name, "---"]
      parent_category.children.each do |child|
        @category_child_array << child.name if child_category != child
      end
    @grandchild_id = Category.find(Product.find(params[:id]).category_id).name
    @category_grandchild_array = Category.find(Product.find(params[:id]).category_id).parent.children
  end


  private
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
      images_attributes: [{image: []}, :product_id],
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
      :images_id,
      :category_id,
      :cost, :days, :prefecture_id,
      category_attributes: [:name], 
      brand_attributes: [:name]
    ).merge(
      user_id: current_user.id, 
    )
  end

end

