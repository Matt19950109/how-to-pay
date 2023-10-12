# アプリケーション名
How to Pay

# アプリケーション概要
決済方法ごとに支出額を確認できる家計簿アプリ

# URL
デプロイ作業実施後記載予定

# テスト用アカウント

※いずれも実装後に記載予定

* Basic認証パスワード：○○

* Basic認証ID：○○

* メールアドレス：○○

* パスワード：○○

# 利用方法

# アプリケーションを作成した背景
最近ではクレジットカード、QRコード決済、ICカード決済など複数の決済方法が存在しています。従来の家計簿では支出額のみ記入して支出を管理するものが多いため、各決済方法ごとの支出額を把握することができないと感じていました。同様の問題を抱えている人も多いのではないかと推測し、支出入力時に決済方法を選択することで決済ごとの支出額が確認できるような家計簿アプリケーションを開発することにしました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1jP8tTWUcF3JVo-FiTMwFQIT7E4KCak81adMUlyMeBek/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明※
実装後掲載予定

# 実装予定の機能
実装後掲載予定

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/1a61925c9f59c9695a4dd7edb6cce2ac.png)](https://gyazo.com/1a61925c9f59c9695a4dd7edb6cce2ac)

## usersテーブル 
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |

### association
- has_many :banks
- has_many :settlements
- has_many :spendings


## banksテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| amount_price       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### association
- belongs_to :user
- has_many   :settlements


## settlementsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| payment            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| bank               | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :bank
- has_many   :spendings


## spendingsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null: false                    |
| item_name          | string     | null: false                    |
| category           | integer    | null: false                    |
| start_time         | date       | null: false                    |
| user               | references | null: false, foreign_key: true |
| settlement         | references | null: false, foreign_key: true |

### association
- belongs_to             :user
- belongs_to             :settlement
- belongs_to_active_hash :category


# 画面遷移図(仮)
[![Image from Gyazo](https://i.gyazo.com/d2db43ae40fa160829cfde13a465394b.png)](https://gyazo.com/d2db43ae40fa160829cfde13a465394b)

# 開発環境
実装後掲載予定

# ローカルでの動作方法
実装後掲載予定

# 工夫したポイント
実装後掲載予定

# 改善点
実装後掲載予定

# 制作時間
実装後掲載予定