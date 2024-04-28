# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| full_name          | string   | null: false |
| full_name_kana     | string   | null: false |
| birth_date         | datetime | null: false |

### Association

- has_many :merhcandises

## merchandises テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| image              | string  | null: false |
| name               | string  | null: false |
| content            | text    | null: false |
| category           | string  | null: false |
| status             | string  | null: false |
| ship_fee           | integer | null: false |
| location           | string  | null: false |
| prepare_period     | integer | null: false, unique: true |
| price              | integer | null: false |
| sales_fee          | integer |
| sales_revenue      | integer |

### Association

- belongs_to :user
- belongs_to :customer

## customers テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postal_code        | integer | null: false |
| prefecture         | string  | null: false |
| city               | string  | null: false |
| street             | string  | null: false |
| building           | string  | null: true  |
| phone_number       | integer | null: false |

### Association

- has_many :merchandises
- has_many :credit_cards

## credit_cards テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| card_number        | integer  | null: false |
| expire_date        | datetime | null: false |
| security_code      | integer  | null: false |

### Association

- belongs_to :customer