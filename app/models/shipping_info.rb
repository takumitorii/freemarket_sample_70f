class ShippingInfo < ApplicationRecord
  belongs_to :seller, optional: true
  has_many :products

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
