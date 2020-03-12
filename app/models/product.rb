class Product < ApplicationRecord
  belongs_to :seller, dependent: :destroy
  belongs_to :buyer, dependent: :destroy
  belongs_to :category, dependent: :destroy
  belongs_to :brand, dependent: :destroy
  has_many   :images, dependent: :destroy

  
end
