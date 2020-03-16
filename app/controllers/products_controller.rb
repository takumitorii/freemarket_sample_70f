class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def new
    @product = Product.new
    @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
    @images = Image.new
    @category = Category.new
    @brand = Brand.new
    @shipping = Shipping.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      params[:images]['image'].each do |a|
        @images = @product.images.create!(image: a)
      end
      @product.judgment = 1
      @product.save
      redirect_to product_path(@product)
    else
      redirect_to new_product_path
    end
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
    @product = Product.find(params[:id])
    @category = Category.find(params[:id])
    @brand = Brand.find(params[:id])
  end

  def update
    @parents = Category.where(ancestry: nil)
    if params[:product].keys.include?("image") || params[:product].keys.include?("images_attributes") 
      if @product.valid?
        if params[:product].keys.include?("image") 
          update_images_ids = params[:product][:image].values #投稿済み画像 
          before_images_ids = @product.images.ids
          before_images_ids.each do |before_img_id|
            Image.find(before_img_id).destroy unless update_image_ids.include?("#{before_img_id}") 
          end

        else
          before_images_ids.each do |before_img_id|
            Image.find(before_img_id).destroy 
          end
        end
        @product.update(product_params)
        @size = @product.categories[1].sizes[0]
        @product.update(size: nil) unless @size
        redirect_to product_path(@products), notice: "商品を更新しました"
      else
        render 'edit'
      end
    else
      redirect_back(fallback_location: root_path,flash: {success: '画像がありません'})
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

  private
  def product_params

    params.require(:product).permit(
      :name, :price, 
      :description, 
      :status, 
      :images_id,
      :size,
      :judgment,
      :category_id,
      images_attributes: [{image: []}, :product_id],
      category_attributes: [:name], 
      brand_attributes: [:name],
      shipping_attributes: [:cost, :days, :prefecture_id]
    ).merge(user_id: current_user.id)
  end

end

