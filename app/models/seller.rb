class Seller < ApplicationRecord
  belongs_to :shipping_info
  belongs_to :user
  has_many   :products
end
