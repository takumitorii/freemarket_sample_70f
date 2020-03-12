class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  # 購入者
  belongs_to  :card
  belongs_to  :destinations

  # 出品者及び出品中商品
  has_many :products
  has_many :shippings
end
