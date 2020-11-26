# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| --------       | ------  | ----------- |
| name           | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| birthday_year  | integer | null: false |
| birthday_month | integer | null: false |
| birthday_day   | integer | null: false |


### Asociation

- has_many :items
- has_many :transactions

## item テーブル

| Column       | Type       | Options                        |
| -------      | ---------  | ------------------------------ |
| item_name    | string     | null: false;                   |
| introduction | text       | null: false;                   |
| price        | integer    | null: false;                   |
| category     | integer    | null: false;                   |
| condition    | integer    | null: false;                   |
| delivery_fee | integer    | null: false;                   |
| send_source  | integer    | null: false;                   |
| send_time    | integer    | null: false;                   |
| user         | references | null: false, foreign_key: true |
| stock        | boolean    | null: false;                   |
<!-- *| image | ActiveStrage     | null: false;                   | -->


### Association

- belongs_to :user
- has_one :transaction

## transaction テーブル

| Column          | Type       | Options                         |
| ------          | ------     | -----------                     |
| postal_code     | string     | null: false                     |
| prefecture      | string     | null: false                     |
| city            | string     | null: false                     |
| house_number    | string     | null: false                     |
| building_name   | string     |                                 |
| phone_number    | string     | null: false                     |
| user            | references | null: false , foreign_key: true |
| item            | references | null: false , foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item