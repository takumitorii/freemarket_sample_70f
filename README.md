# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
| nickname | string | null: false |
| email| string | null: false |
| user_password | string | null: false |
| user_image | string | null: false |
| family_name | string | null: false |
| first_name | string | null: false |
| family_name_kana | string|null: false |
| first_name_kana | string|null: false |
| birth_year| date | null: false |
| birth_month| date | null: false |
| birth_day| date | null: false |
| introduction | text ||

### Association
- has_many :seller
- has_many :buyer
- has_many :destination_infos
- has_many :credit_cards
- has_one  :cart


## destination_infoテーブル
|Column|Type|Options|
|------|----|-------|
| user_id | integer | null: false, foreign_key: true|
| family_name | string | null: false|
| first_name | string | null: false|
| family_name_kana | string | null: false|
| first_name_kane | string | null: false|
| post_code | string | null: false|
| prefecture | string | null: false|
| city | string | null: false|
| adless | string | null: false|
| building_name | string | null: false|
| phone_number | string | null: false|


### Association
- belongs_to :user


## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|security_code|string|null: false|
|card_number|string|null: false|
|expiration_year|string|null: false|
|expiration_month|string|null: false|

### Association
- belongs_to :user

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
| category_name | string | null: false |
| ancestry |||

### Association
- has_many :product

## productテーブル

|Column|Type|Options|
|------|----|-------|
| name | string | null: false |
| price | string | null: false |
| description | string|null: false |
| status | string | null: false |
| category_id | integer | null: false, foreign_key: true |
| brand_id | integer | null: false, foreign_key: true |
| product_image_id | integer | null: false, foreign_key: true |
| seller_id | integer | null: false, foreign_key: true |
| buyer_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :seller
- belongs_to :buyer
- belongs_to :category
- has_many :carts, through: :product_carts
- has_many :product_images
- has_many :brands

### Association

## product_imageテーブル
|Column|Type|Options|
|------|----|-------|
| product_image | string | null: false |
| product_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :product

### Association


## cartテーブル
|Column|Type|Options|
|------|----|-------|
|user_id| reference | null: false, foreign_key: true |
|product_cart_id | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product_cart

## product_cartテーブル
|Column|Type|Options|
|------|----|-------|
| product_id | reference | null: false, foreign_key: true |
| cart_id | reference | null: false, foreign_key: true |

### Association
- belongs_to :product
- belongs_to :cart


## brandテーブル
|Column|Type|Options|
|------|----|-------|
| name | string | index: true |

### Association
- has_many :products


## sellerテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :shipping_info
- belongs_to :user
- has_many :products


## buyerテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :products

## shipping infoテーブル
|Column|Type|Options|
|------|----|-------|
| shipping_cost | integer | null:false |
| shipping_area | string | null:false |
| shipping_days | integer | null:false |
| seller_id | reference | null:false |

### Association
- belongs_to :seller
