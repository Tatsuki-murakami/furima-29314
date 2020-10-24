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

# テーブル設計

## users テーブル

| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| family_name          | string   | null: false |
| name                 | string   | null: false |
| family_name_furigana | string   | null: false |
| name_furigana        | string   | null: false |
| email                | string   | null: false |
| encrypted_password   | string   | null: false |
| nickname             | string   | null: false |
| birthday             | date     | null: false |

### Association

- has_many :items
- has_one  :buy
- has_many :comments

## items テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| name         | string  | null: false                    |
| price        | integer | null: false                    |
| user_id      | integer | null: false, foreign_key: true |
| category_id  | integer | null: false                    |
| describe     | text    | null: false                    |
| condition_id | integer | null: false                    |
| shipping_id  | integer | null: false                    |
| area_id      | integer | null: false                    |
| day_id       | integer | null: false                    |

### Association

- has_many   :comments
- belongs_to :user
- has_one    :buy

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false, foreign_key: true |
| user_id | string     | null: false, foreign_key: true |
| item_id | string     | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery

## delivery テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | integer    | null: false, foreign_key: true |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |

### Association

- has_one    :buy

