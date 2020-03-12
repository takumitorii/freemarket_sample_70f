class ProductImage < ApplicationRecord
  belongs_to :product, optional: true

  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def self.create_product_by(product_params)

    return false if product_params[:image].nil?

    Product.transaction do 
      product_params[:image].each do |photo|
        new_photo = Product.new(image: photo)
        return false unless new_photo.save!
      end
    end

    true
  end
end
