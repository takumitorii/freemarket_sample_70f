class Seller < ApplicationRecord
  has_one :shipping_info, dependent: :destroy
  belongs_to :user
  has_many   :products
end
