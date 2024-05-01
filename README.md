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

| Column        | Type    | Options                       |
| ------------- | ------- | ----------------------------- |
| item_name     | string  | null: false                   |
| price         | integer | null: false                   |
| user          | string  | null: false foreign_kye: true |
| category      | string  | null: false                   |
| condition     | string  | null: false                   |
| shipping_cost | string  | null: false                   |
| shipping_days | string  | null: false                   |
| descriprion   | text    | null: false                   |
| region        | string    | null: false                   |

### Association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column    | Type    | Options                       |
| --------- | ------- | ----------------------------- |
| user      | string  | null: false foreign_kye: true |
| price     | integer | null: false foreign_kye: true |
| item_name | string  | null: false foreign_kye: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :addresse

## addressesテーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | integer | null: false |
| prefectures    | string  | null: false |
| street_address | integer | null: false |
| municioaliry   | string  | null: false |
| phone_number   | integer | null: false |

### Association

- belongs_to :order
