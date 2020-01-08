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
##  usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|j_family_name|string|null: false|
|j_first_name|string|null: false|
|email|string|null: false unique: true|
|password|string | null: false|
|phonenumber|string| null: false|
|birthday_year|string|null:false|
|birthday_month|string|null:false|
|birthday_day|string|null:false|


### Association

- has_many :products
- has_one :evaluation
- has_one  :Streetaddress


## products
|Column|Type|Options|
|------|----|-------|
|seller_id|string|foreign_key: true|
|buyer_id|string|foreign_key: true|
|product_name|string|null: false|
|product_discription|text|null: false|
|product_category|string|null: false|
|product_brand|string||
|product_state|string|null: false|
|delivery_fee|string|null: false|
|sending_area|string|null: false|
|sending_day|string|null: false|
|product_price|integer|null: false|

### Association

- belongs_to :user
- has_many :images
- has_many :categories




## Streetaddress
|Column|Type|Options|
|------|----|-------|
|postar_code|string|null: false|
|prefectuer|string|null: false|
|city_ward|string|null: false|
|address|string|null: false|
|building|string||
|tel|string||

### Association

- belongs_to :user




## evaluations
|Column|Type|Options|
|------|----|-------|
|good|integer|null: false, default: 0|
|normal|integer|null: false, default: 0|
|bad|integer|null: false, default: 0|
|user_id|integer|foreign_key: true|

### Association

- belongs_to :user


## images
|Column|Type|Options|
|------|----|-------|
|product_id|integer|foreign_key: true|
|url|text|null: false|
### Association

- belongs_to :product




## categories
|Column|Type|Options|
|------|----|-------|
|pass|text|null: false|
|item|text|null: false|

### Association

- belongs_to :product

