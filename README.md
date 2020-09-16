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
| family name          | string   | null: false |
| name                 | string   | null: false |
| family name furigana | string   | null: false |
| name furigana        | string   | null: false |
| email                | string   | null: false |
| password             | string   | null: false |
| nickname             | string   | null: false |
| birthday             | datetime | null: false |

### Association

- has_many :items
- has_many :buys
- has_many :comments

## items テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| name         | string  | null: false                    |
| price_id     | integer | null: false                    |
| user_id      | string  | null: false, foreign_key: true |
| category_id  | integer | null: false                    |
| describe     | text    | null: false                    |
| condition_id | integer | null: false                    |
| shipping_id  | integer | null: false                    |
| area_id      | integer | null: false                    |
| day_id       | integer | null: false                    |

### Association

- has_many   :comments
- belongs_to :users
- has_one    :buys

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false, foreign_key: true |
| user_id | string     | null: false, foreign_key: true |
| item_id | string     | null: false, foreign_key: true |


### Association

- belongs_to :items
- belongs_to :users

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user-id | references | null: false, foreign_key: true |
| buy     | boolean    | null: false                    |

### Association

- has_one    :users
- belongs_to :items
- has_one    :address

## address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buy_id  | references | null: false, foreign_key: true |
| address | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- has_one    :buysi