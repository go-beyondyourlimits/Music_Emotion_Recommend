# Music_Emotion_Recommend
## 00_開発環境
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
```
cd docker
docker-compose up -d
```
* dockerコンテナ内に入る
```
docker exec -it <dockerimagename>  /bin/bash
```
* dockerコンテン内で作業する
## 01_ブランチ命名規則
* release/xxxxxxxx_alpha：アルファ版リリース用ブランチ
* release/xxxxxxxx_beta：ベータ版リリース用ブランチ
* development/xxxxxxxx_master：開発用マスターブランチ
* development/xxxxxxxx_xxxxx：開発用個別ブランチ
## 02_運用ルール
* mainブランチへはPushしない
* アルファ版リリース用ブランチは商用環境用
* ベータ版リリース用ブランチはテスト環境での動作確認用
* 開発用個別ブランチで作業した内容を開発用マスターブランチへmergeする
