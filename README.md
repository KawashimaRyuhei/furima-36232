
## Usersテーブル

| column             |  Type   | option      |
|--------------------|---------|-------------|
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| kana_first_name    | string  | null: false |
| kana_last_name     | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :buys

## Itemsテーブル

| column          |  Type      | option                         |
|-----------------|------------|--------------------------------|
| item_name       | string     | null: false                    |
| text            | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| delivery_fee    | integer    | null: false                    |
| shipment_source | integer    | null: false                    |
| shipment_day    | integer    | null: false                    |
| price           | integer    | null: false                    |
| buy             | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

### Association

- has_one :buy
- belongs_to :user

## Buysテーブル

| column          | Type       | option                         |
|-----------------|------------|--------------------------------|
| user_id         | references | null: false, foreign_key: true |
| items_id        | references | null: false, foreign_key: true |
| send_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :send

## Sendsテーブル

| column          | Type       | option                         |
|-----------------|------------|--------------------------------|
| postal_code     | integer    | null: false                    |
| prefectures     | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| telephone       | string     | null: false                    |
| buy_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :buy