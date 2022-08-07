# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :orders
- has_many :items

## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| title              | string      | null: false                    | 
| price              | integer     | null: false                    | 
| introduction       | text        | null: false                    | 
| category_id        | integer     | null: false                    | 
| status_id          | integer     | null: false                    | 
| delivery_charge_id | integer     | null: false                    | 
| prefecture_id      | integer     | null: false                    | 
| delivery_date_id   | integer     | null: false                    | 
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- belongs_to :item

## addresses テーブル


| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| zip             | string     | null: false                    | 
| prefecture_id   | integer    | null: false                    | 
| shikuchouson    | string     | null: false                    | 
| banchi          | string     | null: false                    | 
| building        | string     |                                | 
| phone_num       | string     | null: false                    | 
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order