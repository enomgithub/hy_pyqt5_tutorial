#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtCore [Qt]])
(import [PyQt5.QtWidgets [QWidget QLCDNumber QSlider QVBoxLayout
                          QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    ; 7セグ風の数値表示ウィジェットの作成
    (setv lcd (QLCDNumber self))

    ; スライダウィジェットの作成
    ; デフォルト値: 0
    ; 範囲: 0 - 99
    ; ステップ: 1
    (setv sld (QSlider (. Qt Horizontal) self))

    (setv vbox (QVBoxLayout))
    (.addWidget vbox lcd)
    (.addWidget vbox sld)

    (.setLayout self vbox)

    ; スライダの値が変更されたら、
    ; lcdの表示を更新するように設定する
    ((. sld valueChanged connect) (. lcd display))

    (.setGeometry self 300 300 250 150)
    (.setWindowTitle self "Signal and slot")
    (.show self)))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
