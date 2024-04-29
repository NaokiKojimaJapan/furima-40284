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

- has_many :items
- has_many :histories

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| image              | string     | null: false |
| name               | string     | null: false |
| content            | text       | null: false |
| category           | string     | null: false |
| status             | string     | null: false |
| ship_fee           | integer    | null: false |
| location           | string     | null: false |
| prepare_period     | integer    | null: false, unique: true |
| price              | integer    | null: false |
| sales_fee          | integer    |
| sales_revenue      | integer    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :history

## histories テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| item_id            | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postal_code        | integer | null: false |
| prefecture         | string  | null: false |
| city               | string  | null: false |
| street             | string  | null: false |
| building           | string  | null: true  |
| phone_number       | integer | null: false |
| history_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :history