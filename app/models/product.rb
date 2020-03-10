class Product < ApplicationRecord
  belongs_to :seller, optional: true
  belongs_to :buyer, optional: true
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  has_many   :product_images

  accepts_nested_attributes_for :category, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  accepts_nested_attributes_for :product_images, allow_destroy: true
end
