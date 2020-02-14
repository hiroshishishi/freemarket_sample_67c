# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true|
|telephone|string|unique: true|

### Association
- has_many :items
- has_many :likes dependent: :destroy
- has_many :wallets dependent: :destroy
- has_many :orders dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :social_providers dependent: :destroy
- has_one :delivery_addresses dependent: :destroy


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_user_id|references|null: false, foreign_key: {to_table: :users}|
|category_id|references|null: false, foreign_key: true|
|title|string|null: false, index: true|
|text|text|null: false|
|brand|string||
|condition|integer|null: false|
|fee|integer|null: false|
|delivery_days|integer|null: false|
|price|integer|null: false|
|trading_status|boolean|null: false|
### Association
- belongs_to :user
- belongs_to :category
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :item_image dependent: :destroy
- has_one :order 
- belongs_to_active_hash :prefecture

## social_providersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|provider|string|null: false|
### Association
- belongs_to :user

## delivery_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|zip_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|street|string|null: false|
|block_room|string||
|telephone|string|unique: true|
### Association
- belongs_to :user
- belongs_to_active_hash :prefecture


## walletsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|wallet|integer|null: false|
### Association
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_user_id|references|null: false, foreign_key: {to_table: :users}|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|text|text|null: false|
### Association
- belongs_to :user
- belongs_to :item

## itemImagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image_url|string|null: false|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items
- has_ancestry

