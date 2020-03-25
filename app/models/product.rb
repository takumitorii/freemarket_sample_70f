class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand, dependent: :destroy, optional: true

  has_many   :images, dependent: :destroy

  accepts_nested_attributes_for :category, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

  validates_associated :images
  validates :name, :price, :prefecture_id, :category_id, :description, :user_id, presence: true
  validates :images, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
end
