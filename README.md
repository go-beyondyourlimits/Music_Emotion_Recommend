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
* docker環境作成
backend/web-back/.envを作成し以下を記載
```
SECRET_KEY='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
DEBUG=False
HOST=db
USER=user
```
* backendコンテナにてDataBaseの作成
```
docker-compose run --rm web-back sh -c "python manage.py makemigrations"
docker-compose run --rm web-back sh -c "python manage.py migrate"
```
* backendコンテナにて権限ユーザを作成
```
docker-compose run --rm web-back sh -c "python manage.py createsuperuser"
```
* frontendコンテナにてパッケージインストール
```
docker-compose run --rm web-front sh -c "yarn add next react"
```
* コンテナをビルド
```
docker-compose up --build
```
* dockerコンテナ内に入る
```
docker exec -it <dockerimagename>  /bin/bash
```
* dockerコンテン内で作業する
## 02_ブランチ命名規則
* release/xxxxxxxx_alpha：アルファ版リリース用ブランチ
* release/xxxxxxxx_beta：ベータ版リリース用ブランチ
* development/xxxxxxxx_master：開発用マスターブランチ
* development/xxxxxxxx_xxxxx：開発用個別ブランチ
## 03_運用ルール
* mainブランチへはPushしない
* アルファ版リリース用ブランチは商用環境用
* ベータ版リリース用ブランチはテスト環境での動作確認用
* 開発用個別ブランチで作業した内容を開発用マスターブランチへmergeする
