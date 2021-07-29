
## Usersテーブル

| column             |  Type   | option                    |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| kana_first_name    | string  | null: false               |
| kana_last_name     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :buys

## Itemsテーブル

| column          |  Type      | option                         |
|-----------------|------------|--------------------------------|
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefectures_id  | integer    | null: false                    |
| shipment_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :buy
- belongs_to :user

## Buysテーブル

| column          | Type       | option                         |
|-----------------|------------|--------------------------------|
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :send

## Sendsテーブル

| column          | Type       | option                         |
|-----------------|------------|--------------------------------|
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| telephone       | string     | null: false                    |
| buy             | references | null: false, foreign_key: true |

### Association

- belongs_to :buy