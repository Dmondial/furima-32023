# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| --------           | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |


### Asociation

- has_many :items
- has_many :item_prefectures

## item テーブル

| Column          | Type       | Options                        |
| -------         | ---------  | ------------------------------ |
| item_name       | string     | null: false;                   |
| introduction    | text       | null: false;                   |
| price           | integer    | null: false;                   |
| category_id     | integer    | null: false;                   |
| condition_id    | integer    | null: false;                   |
| delivery_fee_id | integer    | null: false;                   |
| send_source_id  | integer    | null: false;                   |
| send_time_id    | integer    | null: false;                   |
| user            | references | null: false, foreign_key: true |
<!-- *| image | ActiveStrage     | null: false;                   | -->
<!-- | stock        | boolean    | null: false;                   | -->

### Association

- belongs_to :user
- has_one :item_purchase


## item_purchase テーブル

| Column          | Type       | Options                         |
| ------          | ------     | -----------                     |
| user            | references | null: false , foreign_key: true |
| item            | references | null: false , foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order_address


## order_address

| Column          | Type       | Options                         |
| ------          | ------     | -----------                     |
| postal_code     | string     | null: false                     |
| prefecture_id   | string     | null: false                     |
| city            | string     | null: false                     |
| house_number    | string     | null: false                     |
| building_name   | string     |                                 |
| phone_number    | string     | null: false                     |
| item_purchase   | references | null: false , foreign_key: true |

### Association

- belongs_to :item_purchase
