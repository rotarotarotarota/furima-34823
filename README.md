# README

## usersテーブル

|Column         |Type  |Options                 |
|---------------|------|------------------------|
|nickname       |string|null: false             |
|email          |string|null: false,unique: true|
|encrypted_password       |string|null: false   |
|first_name     |string|null: false             |
|last_name      |string|null: false             |
|first_name_kana|string|null: false             |
|last_name_kana |string|null: false             |
|birthday       |date  |null: false             |

### Association
- has_one: address, dependent: :destroy
- has_one: credit_card, dependent: :destroy
- has_one: sns_authentication, dependent: :destroy
- has_many: items
- has_many: comments, dependent: :destroy

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|postal_code|string|null: false|
|prefecture_id|integer|null: false,foreign_key: true|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string|null:false|

### Association
- belongs_to: purchase management, optional: true
- belongs_to_active_hash :prefecture

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explain|text|null: false|
|category_id|integer|null: false,|
|state_id|integer|null: false, foreign_key: true|
|shipping_burden_id|integer|null: false,foreign_key: true|
|prefecture_id|integer|null: false,foreign_key: true|
|shipping_day_id|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :seller, class_name: "User"
- has_many: images, dependent: :destroy
- belongs_to: category
- has_many: comments, dependent: :destroy
- belongs_to: brand
- belongs_to_active_hash :state
- belongs_to_active_hash :shipping_burden
- belongs_to_active_hash :shipping_day
- belongs_to_active_hash :prefecture

## purchase managementテーブル
|Column|Type|Options|
|------|----|-------|
|user  |references|null:false,foreign_key: true|
|customer_id|string|null:false|
|card_id|string|null:false|

### Association
 belong_to: user
 has one: item
 has one: address