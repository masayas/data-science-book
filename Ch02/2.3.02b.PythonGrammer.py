# -*- coding: utf-8 -*-

## Pythonの文法

## #はコメントを表します

#---------------------------------------------------------------
### タプル

# タプルはリストに似たデータ型で、丸括弧で表します。
# タプルでは内容の変更ができません。

# >下記を実行するとエラーが発生します（変えられないものを変えようとするため）。
#---------------------------------------------------------------

#タプル
# -- リストと同様だが、内容を変えられない

#2つのタプルを含むタプル
two_tapples = (("A", "B", "C", "D"), ("apple", "orange", "lemon", "apple"))

print( two_tapples )
print( two_tapples[1][2] )      #(0から数えて)1番目のタプルの2番目の要素

two_tapples[1][2] = "orange"    #内容は変えられない…TypeErrorが発生 