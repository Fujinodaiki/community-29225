# アプリ名  
KIDUNA

# アプリの概要
このサイトでできる事  
* ある目的を持ったコミュニティを自分で作る事ができます。
* コミュニティ内でチャット形式で話す事ができます。
* 他の人が作ったコミュニティに承認される事で、入る事ができます。
* 現在あるコミュニティを検索する事ができます。

# 本番環境  
Herokuを使用したデプロイを行っています。

# 制作の背景  
自分の趣味や考えを話したいと思っているけど、  
それを話した結果、どう思われてしまうかを気にしてしまい、話せずにいる人は案外多いと思います。  
そんな人を対象に共通の趣味や考え方を持った人と出会える場所を提供したいと思い、  
このサイトを作成してみようと思いました。  

# 工夫したポイント  
コミュニティの参加に申請、承認の機能を使った事。

# 使用した言語
* Ruby

# 使用したフレームワーク
* Ruby on rails 
  
# テーブル設計

## users テーブル

|Column  | Type  |Options    |
| ------ | ----- | --------- |
| name   | string| null:false|
| email  | string| null:false|
|password| string| null:false|

### Association

- has_many :room_users
- has_many :rooms,through:room_users
- has_many :messages
- has_many :applys

## roomsテーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| name    | string | null: false |
| category| string | null: false |
| comment | text   | null: false |


## Association

- has_many :room_users
- has_many :users,through:room_users
- has_many :massages
- has_many :applys


## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## applys テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :room
