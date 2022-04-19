# Music_Emotion_Recommend
## 00_全体像
* フロントエンド
  * JavaScript(React)
* バックエンド
  * Python
* データベース
  * PosgreSQL or MySQL
* Webサーバー
  * Nginx
* 開発環境
  * Docker
  * docker-compose
* インフラ
  * AWS 
## 01_開発環境
### ローカル準備 (Dockerインストール)
Homebrewm経由でインストールする

* Homebrewのインストール
```
% /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
* Dockerのインストール
```
brew install --cask docker
```
* docker-composeのインストール (バージョン1.27.4)
```
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
* code clone
```
git clone https://github.com/go-beyondyourlimits/Music_Emotion_Recommend.git
```
### docker環境作成
* backend/web-back/.envを作成し以下を記載
```
SECRET_KEY='XXXXXXXXXXXXXXXXXXXXXXXXXXX'
DEBUG=False
HOST=db
USER=user
```
* コンテナの作成
```
bash run.sh # dockerコンテナを作成するファイル
```
* コンテナをビルド
```
docker-compose up --build
```
以下のログが表示されたら `http://localhost:3000`へアクセス
```
.....
.....
event - compiled successfully
```
* dockerコンテナ内に入る
```
docker exec -it <dockerimagename>  /bin/bash
```
### dockerコンテン内作業

### pre-commitの導入
gitcommitする際にコードの自動チェックを行うため、pre-commitmを導入する
以下、ローカル環境のMusic_Emotion_Recommendディレクトリで実施
* pre-commitのインストール
```
pip install pre-commit
```
* セットアップ
```
pre-commit install
```

## 02_ブランチ運用規則と命名規則
### main:マスターブランチ
Pushしない．マージを行うだけのブランチになりリリースと同時に更新する
### release/xxxxxxxx:リリースブランチ
リリースするために使うブランチ. developブランチからreleaseブランチを切って,そのブランチでリリース作業を行う．リリース作業が完了したら,mainブランチとdevelopブランチにマージして，mainブランチのマージコミットにリリースタグ（バージョンなど）を記載する．その後，releaseブランチは削除する．
### development/xxxxxxxx：開発用ブランチ
開発の中心となるブランチ．開発中はdevelopブランチからブランチを切って，作業完了後に再びマージするという作業を繰り返すことになる，mainブランチ同様,直接このブランチにコミットすることはないので注意．リポジトリを新規作成したときに,mainブランチからdevelopブランチを切っておく．
### feature/xxxxxxxx：機能の追加や変更ブランチ
featureブランチは，機能の追加や変更，バグフィックスを行うブランチ．ひとつの変更に対してひとつのfeatureブランチを切ること．ブランチの名前は．変更の内容がすぐに分かるような名称にする．developブランチから派生させ，作業完了後に再びdevelopブランチにマージする．マージ完了後に削除する．
### hotfix/xxxxxxxxx:リリース時の急な修正を行うブランチ
製品のリリース時に重大な不具合が見つかる場合の改修ブランチ．mainブランチから直接hotfixブランチを切って緊急の修正を行う．修正完了後にmainブランチとdevelopブランチにマージして,リリースタグ（マイナーバージョンなど）をうつ．その後，hotfixブランチは削除する．派生元がmainになるだけで,操作的にはreleaseブランチと同様.
## 03_運用ルール
* mainブランチへはPushしない
* アルファ版リリース用ブランチは商用環境用
* ベータ版リリース用ブランチはテスト環境での動作確認用
* 開発用個別ブランチで作業した内容を開発用マスターブランチへmergeする
## 04_issue運用
## 05_参考
* [環境構築]
    * [DockerでReact＋Django+Nginx＋MySQLの環境構築](https://github.com/greenteabiscuit/django-react-nginx-mysql-docker)
* [issue運用]
    * 後日記載
* [pre-commit]
    * [pre-commitでコミット時にコードの整形やチェックを行う](https://zenn.dev/yiskw713/articles/3c3b4022f3e3f22d276d)
