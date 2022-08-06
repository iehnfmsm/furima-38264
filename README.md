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
| birthday_y         | string | null: false               |
| birthday_m         | string | null: false               |
| birthday_d         | string | null: false               |

### Association

- has_many :orders
- has_many :items

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    | 
| price           | string     | null: false                    | 
| introduction    | text       | null: false                    | 
| category        | string     | null: false                    | 
| status          | string     | null: false                    | 
| delivery_charge | string     | null: false                    | 
| delivery_from   | string     | null: false                    | 
| delivery_date   | string     | null: false                    | 
| user            | references | null: false, foreign_key: true |

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
| prefecture      | string     | null: false                    | 
| shikuchouson    | string     | null: false                    | 
| banchi          | string     | null: false                    | 
| building        | string     |                                | 
| phone_num       | string     | null: false                    | 
| order_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :order