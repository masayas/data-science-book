# -*- coding: utf-8 -*-

## Pythonの文法

## #はコメントを表します

#---------------------------------------------------------------
### ディクショナリ

# ディクショナリもリストに似たデータ型です。  
# キーと値を対で格納するところが特徴です。
#---------------------------------------------------------------

#ディクショナリ
# -- キーと値の対で構成される

# : を挟んで前にキー、後に値を記述（ここでは4つの要素を格納）
Price = { "Kids":None, "Short":2.45, "Medium":2.85, "Tall":3.25, "Grand":3.65 }

print( "Price of Medium : ", Price["Medium"] )  #キーの名称を指定して参照

print( "\n" )
print( "keys=   ", Price.keys()   )   #キーの一覧
print( "values= ", Price.values() )   #値の一覧
