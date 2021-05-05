# テーブル設計

## usersテーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| nickname      | string   | null: false |
| email         | string   | null: false |
| password      | string   | null: false |
| name          | string   | null: false |
| name_reading  | string   | null: false |

### Association
- has_many :items
- has_many :orders
- has_one :address


## itemsテーブル

| Column          | Type        | Options     |
| --------------- | ----------- | ----------- |
| name            | string      | null: false |
| description     | text        | null: false |
| category        | integer     | null: false |
| condition       | integer     | null: false |
| responsibility  | integer     | null: false |
| delivery_area   | integer     | null: false |
| delivery_days   | integer     | null: false |
| price           | integer     | null: false |
| user            | references  | null: false |

### Association
- belongs_to :user
- has_one :orders


## ordersテーブル

| Column | Type        | Options     |
| ------ | ----------- | ----------- |
| price  | integer     | null: false |
| user   | references  |             |
| items  | references  |             |

### Association
- belongs_to :user
- belongs_to :items
- has_one :address

## addressテーブル

| Column        | Type        | Options     |
| ------------- | ----------- | ----------- |
| postal_code   | string      | null: false |
| prefecture    | integer     | null: false |
| city          | string      | null: false |
| house_number  | string      | null: false |
| building_name | string      |             |
| phone_number  | string      | null: false |
| user          | references  |             |
| orders        | references  |             |

### Association
- belongs_to :user
- belongs_to :orders