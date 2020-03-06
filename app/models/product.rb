class Product < ApplicationRecord
  belongs_to :seller
  belongs_to :buyer
  belongs_to :category
  belongs_to :brand
  has_many   :product_images

  class Book < ApplicationRecord
    mount_uploader :image, ImgUploader
  end
end
