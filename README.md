# README

# paddleUp DB設計

# usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|encypted_password|string|null: false|
|school|string|null: false|
|occupation|string|null: false|
|age|integer|null: false|
### Association
- has_many :boats
- has_many: comments

# boatsテーブル
|------|----|-------|
|image|string|null: false|
|description|text|null: false|
|brand_id|integer|null: false|
|size_id|integer|null: false|
### Association
- belongs_to :user
- has_many: comments
- has_one :spot

# commentsテーブル
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false|
|boat_id|integer|null: false|
### Association
- belongs_to :boat
- belongs_to :user

# spotsテーブル
|------|----|-------|
|address|string|null: false|
|latitude|float|null: false|
|longitude|float|null: false|
|review_id|references|foreign_key: true, null: false|
### Association
- belongs_to :boat