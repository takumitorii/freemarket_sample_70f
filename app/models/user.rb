class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  # 購入者
  belongs_to  :card,  optional: true, dependent: :destroy
  belongs_to  :destination,  optional: true, dependent: :destroy

  # 出品者及び出品中商品
  has_many :products, dependent: :destroy

  mount_uploader :user_image, ImageUploader

end
