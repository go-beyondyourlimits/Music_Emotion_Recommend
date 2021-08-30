# 機械学習レコメンドシステムモデル　


### ToDoList

* 今あるデータセットで学習モデルを作成・予測までのコードを思い出す

    1.　google colab @ sknowledgeのアカウント で実装
    2.　データセット作り( wav => スペクトログラム化　.png)
    3.　学習する。とりあえずvgg16 で良い。あとで、学習モデルは検討
    4.　予測・精度検証
    5.　Flask上で載せる
    
* Did 
    1. sknowledge のグーグルドライブに入れた
    2. MERのwavデータも入れた
    3. 一度、colabデータセット(サブセット)で学習させたい 
    4. .h5等のファイルはどこに保存する、どこで学習する？
    5. 参考用スライドをアップロードする 

* Spotifyから30秒の音楽をダウンロードし、その楽曲で学習・ファインチューニング
    1. playlist取得　（できたら、webアプリの人のを参考にして、ブラウザ上でプレイリスト作ってダウンロード）
    2. ダウンロードした音楽を、スペクトログラム化
    3. 学習モデル作成
    4. 予測・精度検証
    5. Flask上に載せる


##### playlist取得パート
１. uri + 楽曲特徴量取得
[How to Leverage Spotify API + Genius Lyrics for Data Science Tasks in Python](https://medium.com/swlh/how-to-leverage-spotify-api-genius-lyrics-for-data-science-tasks-in-python-c36cdfb55cf3)

---




### 研究の時のディレクトリ構造＜参考用＞
 
 ```python
  ./MasterResearch                           修論で利用した元のデータセットと作成したプログラムが入っている。
    ├── MER_audio_taffc_dataset_wav  # 元のデータセット [4Q audio emotion dataset (Russell's model) (2018).](http://mir.dei.uc.pt/downloads.html) 
    │   ├── Q1　 Happy
    │   ├── Q2  Tense madness 
    │   ├── Q3  sadness
    │   └── Q4  relax
    │
    ├── Result                               # 結果
    │   ├── CNN
    │   ├── LSTM
    │   ├── VGG16
    │   ├── VGG19
    │   └── analyze_data
    │
    ├── src                                 # 各モデル毎のpython コード
    │   ├── CNN 
    │   ├── LSTM
    │   ├── VGG16
    │   ├── VGG19
    │   ├── __pycache__
    │   ├── analyze_data                   # データ分析用のpython コード
    │   ├── pre_train_dir                  # 事前学習関連のpython コード
    │   └── training_2
    │
    └── src_ipynb                           # ノートブック形式の
 ```
 
### 課題

* 長方形のまま出来たらより良い
* その場合コストがかかるが、良いＧＰＵ環境をつかえるか？
* 予測精度はどれくらいで良しとする？最初は動けばよい？
* 実際の研究のお話＝＞　データセットの作り方を工夫していたので精度が上がっていた
* 1曲中からクリップを切って学習（データの水増し）
* 


    
## 参考にしたサイト