#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QToolTip QPushButton QApplication]])
(import [PyQt5.QtGui [QFont]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    ;; ポップアップに使用するフォントの設定
    ((. QToolTip setFont) (QFont "SansSerif" 10))

    ;; ウィジェットにカーソルを合わせると説明がポップアップするように設定
    ((. self setToolTip) "これは<b>QWidget</b>ウィジェットです")

    ;; QWidgetの子ウィジェットとしてボタンを作成
    (setv btn (QPushButton "Button" self))

    ;; ウィジェットにカーソルを合わせると説明がポップアップするように設定
    ((. btn setToolTip) "これは<b>QPushButton</b>ウィジェットです")

    ;; ボタンのサイズを適正サイズに自動で設定
    ((. btn resize) ((. btn sizeHint)))

    ;; 配置場所の指定
    ;; 親ウィジェット内の x=50, y=50 の位置に配置
    ((. btn move) 50 50)

    ;; ウィジェットの左上を
    ;; ディスプレイの x=300, y=300 の位置に
    ;; サイズ w=300, h=200 で配置
    ((. self setGeometry) 300 300 300 200)

    ;; タイトルの設定
    ((. self setWindowTitle) "ToolTip")
    None))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  ((. ex show))
  ((. app exec_))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
