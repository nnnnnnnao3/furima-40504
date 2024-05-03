# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false             |
| first_name         | string | null: false             |
| last_name          | string | null: false             |
| kana_first_name    | string | null: false             |
| kana_last_name     | string | null: false             |
| birthday           | date   | null: false             |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| descriprion      | text       | null: false                    |
| prefecture_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municioaliry   | string     | null: false                    |
| street_address | string     | null: false                    |
| phone_number   | string     | null: false                    |
| building_name  | string     |                                |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
