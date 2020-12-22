## アプリ名
rails_app TECMOVIE

## 制作期間
- 9月1日〜10月2日

## 概要
- 100MBの動画を投稿できます
- 動画にはコメント機能が存在しており、動画について登録者、視聴者とが、感想や意見を交わし、視聴者と動画登録者が交流を図ることができます
- お気に入りの動画をマイリストとして保存して後で確認できます

## 本番環境
- https://whispering-shore-97326.herokuapp.com/
# ログイン機能
- ゲストログインのボタンをクリックしていただければゲスト用のアカウントでログインすることができます

## 制作背景
高校生の頃からニコニコ動画、youtubeを利用しておりテックキャンプ を受講してどんな仕組みで動画投稿サイトができているのか実際に制作して見たかった事と
感動できて、人に感謝を！をコンセプトに制作されました
本サイトは１００MB（おおよそ1分）の制限を設けたのは、本当の感謝の言葉はシンプルで1分以内に、かつ人の心に響くのでは？と考えたからです

## 工夫したポイント
- ゲストログイン機能（クリックしただけでゲスト用のアカウントの付与）
- TOPページ（ログイン前のページのデザインや画像の配置）
- 検索機能
- 新規投稿機能、動画のサムネイルの表示と動画を変更する事をJSで実装した事

## 使用技術
# 言語
Ruby/Haml/SCSS/Javascript

# ワークフレーム
Ruby on Rails

# インフラ
Heroku

# データベース
MySQL PG

# ソース管理
GitHub GithubDesktop

# テスト
RSpec

# エディタ
VSCode 

## 課題、今後実装したい機能
# 今後実装したい機能
- 動画のソート機能
- コミュニティ（投稿者や動画の応援コミュニティ）
- ランキング機能
- コントローラーのテスト、統合テスト
# 課題
- hamlを使い慣れていなかったのでBEMの命名規則が雑になってしまった
見やすい、分かりやすいと行った観点で言えば不合格
- RSpecを理解仕切れていなかったのでモデルのテストのみになってしまった。時間に余裕があればコントローラーや統合テストにも挑戦してみたい
- タイピングミスによるエラーが頻発してしまい、それを解決するに時間がかかってしまった

## DB設計
# userテーブル
|Column|Type|Options|
|-------|-----|-------|
|name|string|null: false|
|email|string|null: false|
|image|string||
|UserBody|string||

- has_many :posts
- has_many :comments
- has_many :likes
- has_many :lists

# postテーブル
|Column|Type|Options|
|-------|-----|-------|
|title|string|null: false|
|body|text|null: false|
|video|string|null: false|
|user_id|integer|null: false|

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :lists

# commentsテーブル
|Column|Type|Options|
|-------|-----|-------|
|text|text||
|post|references|foreign_key: true|
|user|references|foreign_key: true|

- belongs_to :user
- belongs_to :post

# likeテーブル
|Column|Type|Options|
|-------|-----|-------|
|like|integer||
|post|references|foreign_key: true|
|user|references|foreign_key: true|

- belongs_to :user
- belongs_to :post

# listテーブル
|Column|Type|Options|
|-------|-----|-------|
|list|integer||
|post|references|foreign_key: true|
|user|references|foreign_key: true|

- belongs_to :user
- belongs_to :post