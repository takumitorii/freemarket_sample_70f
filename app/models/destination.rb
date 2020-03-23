class Destination < ApplicationRecord
  belongs_to :user

  validates :family_name, :family_name_kana, :first_name, :first_name_kana, :post_code, :prefecture, :city, :address, presence: true
end
