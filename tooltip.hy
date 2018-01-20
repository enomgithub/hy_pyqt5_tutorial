#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QToolTip QPushButton QApplication]])
(import [PyQt5.QtGui [QFont]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    ; ポップアップに使用するフォントの設定
    (.setFont QToolTip (QFont "SansSerif" 10))

    ; ウィジェットにカーソルを合わせると説明がポップアップするように設定
    (.setToolTip self "これは<b>QWidget</b>ウィジェットです")

    ; QWidgetの子ウィジェットとしてボタンを作成
    (setv btn (QPushButton "Button" self))

    ; ウィジェットにカーソルを合わせると説明がポップアップするように設定
    (.setToolTip btn "これは<b>QPushButton</b>ウィジェットです")

    ; ボタンのサイズを適正サイズに自動で設定
    (.resize btn (.sizeHint btn))

    ; 配置場所の指定
    ; 親ウィジェット内の x=50, y=50 の位置に配置
    (.move btn 50 50)

    ; ウィジェットの左上を
    ; ディスプレイの x=300, y=300 の位置に
    ; サイズ w=300, h=200 で配置
    (.setGeometry self 300 300 300 200)

    ; タイトルの設定
    (.setWindowTitle self "ToolTip")

    ; ウィジェットを表示
    (.show self)))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
