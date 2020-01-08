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
|nickname|string|nill: false|
|family_name|string|nill: false|
|first_name|string|null: false|
|j_family_name|string|null: false|
|j_first_name|string|nill: false|
|email|string|nill: false unique: true|
|password|string | nill: false|
|phonenumber|string| nill: false|
|birthday_year|string|nill:false|
|birthday_month|string|nill:false|
|birthday_day|string|nill:false|
|buyed_products|string|foreign_key: "buyer_id"|
|selling_products|string|foreign_key: "seller_id"|
|sold_products|string|foreign_key: "seller_id"|


### Association

- has_many :products
- has_many :evaluations
- has_one  :Streetaddress


## products
|Column|Type|Options|
|------|----|-------|
|seller_id|string|null: false,foreign_key: true|
|buyer_id|string|null: false,foreign_key: true|
|product_name|string|nill: false|
|product_discription|text|nill: false|
|product_category|nill: false|
|product_state|string|nill: false|
|delivery_fee|string|nill: false|
|sending_area|string|nill: false|
|sending_day|string|nill: false|
|product_price|integer|nill: false|
|
### Association

- belongs_to :user
- has_many :images
- has_many :categories




## Streetaddress
|Column|Type|Options|
|------|----|-------|
|postar_code|string|null: false|
|prefectuer|string|null: false|
|city_ward|string|nill: false|
|address|string|nill: false|
|building|string|nill: false|
|tel|string|

### Association

- belongs_to :user




## evaluations
|Column|Type|Options|
|------|----|-------|
|good|integer|null: false|
|normal|integer|null: false|
|bad|integer|nill: false|
|user_id|integer|nill: false|

### Association

- belongs_to :user


## images
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false|
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

