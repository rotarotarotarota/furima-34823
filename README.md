# README

## usersテーブル

|Column         |Type  |Options                 |
|---------------|------|------------------------|
|nickname       |string|null: false             |
|email          |string|null: false,unique: true|
|encrypted_password       |string|null: false             |
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
|user_id|references|foreign_key: true|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_numeber|string||

### Association
- belongs_to: user, optional: true
- belongs_to_active_hash :prefecture

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explain|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|state_id|integer|null: false|
|shipping_burden_id|integer|null: false|
|prefecture_id|integer|null: false|
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

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreing_key: true|
|item_id|references|null: false, foreing_key: true|
|text|text|null: false|

### Association
- belongs_to: item
- belongs_to: user

## sns_authentcationsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|references|foreing_key: true|

### Association
- belongs_to: user, optional: true

## Purchase managementテーブル
|Column|Type|Options|
|------|----|-------|
|user  |references|null:false,foreign_key: true|
|customer_id|string|null:false|
|card_id|string|null:false|