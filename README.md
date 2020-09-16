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

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| name     | string   | null: false |
| email    | string   | null: false |
| password | string   | null: false |
| nickname | string   | null: false |
| birthday | datetime | null: false |

### Association

- has_many :items
- has_many :buys
- has_many :comments

## items テーブル

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| name     | string | null: false                    |
| price    | integer| null: false                    |
| user     | string | null: false, foreign_key: true |
| category | string | null: false                    |
| describe | text   | null: false                    |
| condition| string | null: false                    |
| shipping | boolean| null: false                    |
| area     | string | null: false                    |
| day      | string | null: false                    |
| stock    | boolean| null: false                    |
| image    | string | null: false                    |

### Association

- has_many   :comments
- belongs_to :users
- has_one    :buys

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false, foreign_key: true |


### Association

- belongs_to :items
- belongs_to :users

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| credit  | string     | null: false              

     |
| user    | references | null: false, foreign_key: true |
| address | string     | null: false                    |

### Association

- has_one    :users
- belongs_to :items