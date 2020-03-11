class Seller < ApplicationRecord
  belongs_to :shipping_info, optional: true
  belongs_to :user
  has_many   :products
end
