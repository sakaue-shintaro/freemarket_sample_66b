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

# freemarket_sample DB設計
##  users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|j_family_name|string|null: false|
|j_first_name|string|null: false|
|email|string|default: ""n null: false unique: true|
|password|string|default: "" null: false unique: true|
|phonenumber|string| null: false,unique: true|
|birthday_year|string|null:false|
|birthday_month|string|null:false|
|birthday_day|string|null:false|


### Association

- has_many :products
- has_one :evaluation
- has_one :address
- has_one :pay
- has_many :buyed_products, foreign_key: "buyer_id", class_name: "product"
- has_many :saling_products, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "product"
- has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "product"


## pay
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|number|integer|null: false|
|year|integer|null: false|
|month|integer|null: false|
|code|integer|null: false|


### Association

belongs_to  :user



## products
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false,foreign_key: true|
|name|string|null: false|
|discription|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand|string||
|state|string|null: false|
|delivery_fee|string|null: false|
|sending_area|string|null: false|
|sending_day|string|null: false|
|price|integer|null: false|


### Association

- belongs_to :user
- has_many :images
- belongs_to :category
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"




## address
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectuer|string|null: false|
|city_ward|string|null: false|
|address|string|null: false|
|building|string||
|tel|string||
|user_id|integer|null: false,foreign_key: true|

### Association

- belongs_to :user




## evaluations
|Column|Type|Options|
|------|----|-------|
|good|integer|null: false, default: 0|
|normal|integer|null: false, default: 0|
|bad|integer|null: false, default: 0|
|user_id|integer|null: false, foreign_key: true|


### Association

- belongs_to :user


## images
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|url|text|null: false|
### Association

- belongs_to :product




## categories
|Column|Type|Options|
|------|----|-------|
|pass|text|null: false|
|item|text|null: false|

### Association

- has_many  :products

