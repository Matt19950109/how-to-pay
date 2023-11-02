# アプリケーション名
How to Pay

# アプリケーション概要
決済方法ごとに支出額を確認できる家計簿アプリ

# URL
https://how-to-pay.onrender.com

# テスト用アカウント

* Basic認証パスワード：0109

* Basic認証ID：admin

* メールアドレス：m@m

* パスワード：masato1

# 利用方法
①銀行名を登録 <br>
[![Image from Gyazo](https://i.gyazo.com/534eeb85d1f62bb47d9fc1534682a103.png)](https://gyazo.com/534eeb85d1f62bb47d9fc1534682a103)

②決済方法(現金・○○Pay・SUICAなど)を登録 <br>
[![Image from Gyazo](https://i.gyazo.com/caeac8e687aabefb7345ce93c0dc01ac.png)](https://gyazo.com/caeac8e687aabefb7345ce93c0dc01ac)

③手順1、2の登録した情報をもとに支出を登録
[![Image from Gyazo](https://i.gyazo.com/5b261b15fcfaa07ddeb7fafe56fb3ea8.png)](https://gyazo.com/5b261b15fcfaa07ddeb7fafe56fb3ea8)

④登録した支出とカテゴリーごとの今月の総支出額がトップページで確認できるようになります。
[![Image from Gyazo](https://i.gyazo.com/0995fddf0b558bddcdef9f25acdd73cf.png)](https://gyazo.com/0995fddf0b558bddcdef9f25acdd73cf)

# アプリケーションを作成した背景
最近ではクレジットカード、QRコード決済、ICカード決済など複数の決済方法が存在しています。従来の家計簿では金額のみ記入して支出を管理するものが多いため、各決済方法ごとの支出額を把握することができないと感じていました。同様の問題を抱えている人も多いのではないかと推測し、支出入力時に決済方法を選択することで決済ごとの支出額が確認できるような家計簿アプリケーションを開発することにしました。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1jP8tTWUcF3JVo-FiTMwFQIT7E4KCak81adMUlyMeBek/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明


# 実装予定の機能
・javascriptを用いて複数の支出の登録が一括でできるように実装予定<br>
・カテゴリーごとの今月の支出額が表示されるように実装予定

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
| category_id        | integer    | null: false                    |
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
Ruby/Ruby on Rails/Bootstrap/VSCode

# ローカルでの動作方法
以下のコマンドを順に実行<br>
git clone https://github.com/Matt19950109/how-to-pay.git <br>
cd how-to-pay <br>
bundle install <br>


# 工夫したポイント
・登録した銀行名と決済方法の数を確認できるようにbootstrapのbadge機能を用いて登録件数を表示させました。

・カレンダーを表示するgemであるsimple_calenderを導入しトップページにカレンダーを表示させ日ごとの支出が確認できるようにしました。

・決済方法ごとの支出額を確認できるように今月の項目ごとの支出額を表示させてbootstrapのテーブルを用いて表示させました。

・過去の支出額を検索できるようgemのransackを用いて各カテゴリーごとの過去の支出及び検索表示された支出の合計額を表示させるようにしました。

# 改善点
・支出の登録を一件ずつでしか登録できないため複数の支出登録が一括でできるようにJavascriptを用いて実装するとより使いやすいアプリになると考えています。

・支出の各カテゴリーごとのグラフを表示して月ごとの支出の増減が一目見ただけで分かるようにしたいと考えています。

# 制作時間
約155時間