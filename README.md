# テーブル設計

## usersテーブル

| Column          | Type     | Options                   |
| --------------- | -------- | ------------------------- |        
| nickname        | string   | null: false               |
| email           | string   | null: false, unique: true |
| password        | string   | null: false               |
| last_name       | string   | null: false               |
| first_name      | string   | null: false               |
| last_name_kana  | string   | null: false               |
| last_name_kana  | string   | null: false               |
| birthday_id     | integer  | null: false               |


### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | -------------------------------|
| name               | string      | null: false                    |
| description        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| condition_id       | integer     | null: false                    |
| responsibility_id  | integer     | null: false                    |
| delivery_area_id   | integer     | null: false                    |
| delivery_days_id   | integer     | null: false                    |
| price              | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :orders


## ordersテーブル

| Column | Type        | Options                         |
| ------ | ----------- | --------------------------------|
| user   | references  | null: false, foreign_key: true  |
| items  | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :items
- has_one :address

## addressテーブル

| Column        | Type        | Options                         |
| ------------- | ----------- | --------------------------------|
| postal_code   | string      | null: false                     |
| prefecture_id | integer     | null: false                     |
| city          | string      | null: false                     |
| house_number  | string      | null: false                     |
| building_name | string      |                                 |
| phone_number  | string      | null: false                     |
| orders        | references  | null: false, foreign_key: true  |

### Association
- belongs_to :orders