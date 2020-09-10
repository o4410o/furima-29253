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
| password              | string | null: false |
| kanji family_name     | string | null: false |
| kanji first_name      | string | null: false |
| kana family_name      | string | null: false |
| kana first_name       | string | null: false |
| birthday              | date   | null: false |

### Association
- has_one :buyers
- has_many :items
- has_many :deliveries

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| image         | string  | null: false |
| price         | integer | null: false |
| detail        | text    | null: false |
| exhibitor     | string  | null: false |
| category      | string  | null: false |
| status        | string  | null: false |
| delivery_fee  | integer | null: false |
| shipping_area | string  | null: false |

### Association
- belongs_to :users
- has_many :delivery

## buyers テーブル

| Column | Type       | Options                    |
| ------ | ---------- | -------------------------- |
| item   | references | null: false, foreign: true |
| user   | references | null: false, foreign: true |


### Association
- has_many :delivery
- belongs_to :user


## deliveries テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_code    | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | integer | null: false |
| building     | string  |             |
| phone_number | string  | null: false |

### Association
- belongs_to :buyer
- belongs_to :user



- belongs_to :buyer
- belongs_to :delivery

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
