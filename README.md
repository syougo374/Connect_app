# README
### 実行手順
```
$ git clone https://github.com/syougo374/Connect.git 
$ cd OneTime
$ bundle install
$rails db:create && rails db:migrate
$ rails s
```


### タイトル
Connect

### コンセプト
地元のいいところを紹介、可能なら一緒に案内することで新たなコミュニティーを築ける。人と人を繋げるツールとなっています

### バージョン
- ruby2.6.5 
- rails5.2.5 
- postgresql 13.2

### 機能一覧
- ログイン機能
- ユーザーCRUD機能
- 投稿CRUD機能
- フォロー機能
- お気に入り機能
- メッセージ機能
- コメント機能

[カタログ設計](https://docs.google.com/spreadsheets/d/1zWUvTsntoSxx33IVawJI0GqJEZF2ndbEgixWF0hZ9j0/edit#gid=0)

[テーブル定義](https://docs.google.com/spreadsheets/d/1zWUvTsntoSxx33IVawJI0GqJEZF2ndbEgixWF0hZ9j0/edit#gid=1408983820)

[ER図](https://docs.google.com/spreadsheets/d/1zWUvTsntoSxx33IVawJI0GqJEZF2ndbEgixWF0hZ9j0/edit#gid=652702649)

[画面遷移図](https://docs.google.com/spreadsheets/d/1zWUvTsntoSxx33IVawJI0GqJEZF2ndbEgixWF0hZ9j0/edit#gid=295757362)

[ワイヤーフレーム](https://docs.google.com/spreadsheets/d/1zWUvTsntoSxx33IVawJI0GqJEZF2ndbEgixWF0hZ9j0/edit#gid=775796149)

### 要件就業Term２つ以上
- メッセージ機能
- フォロー機能
  
### カリキュラム外の技術
- Vue.js

### 使用予定Gem
- mini_magick
- kaminari
- bcrypt
- geocoder
- bootstrap
- rails_admin
- devise
- omniauth-twitter
- omniauth-facebook
