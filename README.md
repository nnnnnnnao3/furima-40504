# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false             |
| family_name        | string | null: false             |
| last_name          | string | null: false             |
| kana_family_nam    | string | null: false             |
| kana_last_name     | string | null: false             |
| birthday           | date   | null: false             |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| item_name        | string     | null: false                   |
| price            | integer    | null: false                   |
| user             | references | null: false foreign_kye: true |
| category_id      | integer    | null: false                   |
| condition_id     | integer    | null: false                   |
| shipping_cost_id | integer    | null: false                   |
| shipping_day_id  | integer    | null: false                   |
| descriprion      | text       | null: false                   |
| prefectures_id   | integer    | null: false                   |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_kye: true |
| item   | references | null: false foreign_kye: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresse

## addressesテーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| post_code      | string     | null: false                   |
| prefecture_id  | integer    | null: false                   |
| street_address | string     | null: false                   |
| municioaliry   | string     | null: false                   |
| phone_number   | string     | null: false                   |
| order_item     | references | null: false foreign_kye: true |

### Association

- belongs_to :order