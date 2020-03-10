class Seller < ApplicationRecord
  has_one :shipping_info
  belongs_to :user
  has_many   :products
end
