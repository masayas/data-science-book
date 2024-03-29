setwd("~/Dev/data-science-book/ch03/") # current directoryを設定
par(family = "HiraKakuProN-W3")  # 描画の文字設定1をmac用に変更

## 有意確率と有意差検定

#binom.test：二項検定
#第1引数＝発生頻度、第2引数＝試行回数、第3引数＝発生確率

#ランダムに経営者を3回選んだ⇒3回選んで3回とも男性だった
#経営者の男女比は偏っているか
binom.test(3, 3, p=1/2)
#p-valueを確認して判断する
#0.05を下回れば有意と判断する
#　男女同数ではない⇒偏っている
#0.05以上であれば有意ではないと判断する
#　男女同数という可能性もある⇒偏っているとは言えない

#ランダムに経営者を20回選んだ⇒5回が女性で残りが男性だった
binom.test(5, 20, p=1/2)
#p-valueを確認して判断する（上の例と同様）



#カイ2乗検定と残差分析（モザイクプロット）

#データの読込み（携帯電話の機種と料金コース）
DF <- read.table("SmartPhone.csv",
                 sep = ",",                #カンマ区切りのファイル
                 header = TRUE,            #1行目はヘッダー(列名)
                 stringsAsFactors = FALSE, #文字列を文字列型で取込む
                 fileEncoding="UTF-8")     #文字コードはUTF-8

#構造を確認
str(DF)
#先頭を確認
head(DF)

#table：カテゴリを集計
table(DF$機種, DF$コース)
#オブジェクト（名前は何でも良い）に格納
TBL <- table(DF$機種, DF$コース)
#結果を表示
print(TBL)

#集計表を比率で表示
#prop.table：集計結果から比率を計算して表示
#第2引数が1なら横方向、2なら縦方向で計算する
#％で出したいので100を掛けておく
prop.table(TBL, 1) * 100
prop.table(TBL, 2) * 100

#round：桁数の丸め表示
#第2引数で小数点以下を指定（以下の例では2桁）
round( prop.table(TBL, 1)*100, 2 )
round( prop.table(TBL, 2)*100, 2 )

#集計結果を使ってカイ２乗検定を実行
chisq.test(TBL)
#p-valueを確認して判断する
#0.05を下回れば有意（比率に偏りがある）と判断する
#0.05以上であれば有意ではないと判断する

#mosaicplot：カテゴリの集計結果を視覚化
#shade＝TRUEで残差分析の結果を表示
mosaicplot(TBL, xlab="機種", ylab="コース", 
           shade=TRUE, main="コース・機種内訳")
#有意に多いカテゴリが赤
#有意に少ないカテゴリが青

#縦横を逆にする
#t()は行列の行と列を入れ替える関数（転置）
mosaicplot(t(TBL), xlab="コース", ylab="機種",
           shade=TRUE, main="コース・機種内訳")
