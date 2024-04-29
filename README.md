# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false |
| first_name         | string   | null: false |
| last_name          | string   | null: false |
| kana_first_name    | string   | null: false |
| kana_last_name     | string   | null: false |
| birth_date         | date     | null: false |

### Association

- has_many :items
- has_many :histories

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| content            | text       | null: false |
| category_id	       | integer	  | null: false |
| status_id	         | integer	  | null: false |
| shipping_fee_id	   | integer	  | null: false |
| prefecture_id	     | integer	  | null: false |
| shipping_time_id	 | integer	  | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :history

## histories テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postal_code_id     | integer | null: false |
| prefecture_id      | integer | null: false |
| city               | string  | null: false |
| street             | string  | null: false |
| building           | string  |             |
| phone_number       | string  | null: false |
| history            | references | null: false, foreign_key: true |

### Association

- belongs_to :history