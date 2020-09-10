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
| password confirmation | string | null: false |
| kanji family_name     | string | null: false |
| kanji first_name      | string | null: false |
| birthday              | string | null: false |

### Association
- has_one :buyers
- has_many :items
- has_many :deliveries

## items テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| price    | integer | null: false |
| detail   | text    | null: false |

### Association
- belongs_to :users
- has_many :delivery

## buyers テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_id            | string | null: false |
| expiration_date    | string | null: false |
| security_code      | string | null: false |

### Association
- has_many :delivery, through: buyer_delivery
- belongs_to :user


## deliveries テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_code    | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | integer | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association
- has_many :buyer, thorough: buyer_delivery
- belongs_to :user

## buyer_delivery テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| buyer    | references | null: false, foreign_key: true |
| delivery | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to :delivery

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
