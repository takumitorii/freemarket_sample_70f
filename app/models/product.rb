class Product < ApplicationRecord


  belongs_to :user
  belongs_to :category, dependent: :destroy, optional: true
  belongs_to :brand, dependent: :destroy, optional: true
  belongs_to :shipping, dependent: :destroy, optional: true

  has_many   :images, dependent: :destroy


  accepts_nested_attributes_for :category, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :shipping, allow_destroy: true

  validates :name, :price, :description, presence: true
end
