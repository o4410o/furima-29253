# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| kanji_family_name     | string | null: false |
| kanji_first_name      | string | null: false |
| kana_family_name      | string | null: false |
| kana_first_name       | string | null: false |
| birthday              | date   | null: false |

### Association
- has_many :buyers
- has_many :items

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| price         | integer    | null: false                    |
| detail        | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipping_area | integer    | null: false                    |
| shipping_date | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column | Type       | Options                    |
| ------ | ---------- | -------------------------- |
| item   | references | null: false, foreign: true |
| user   | references | null: false, foreign: true |

### Association
- has_one :delivery
- belongs_to :user
- belongs_to :item


## deliveries テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :buyer

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
