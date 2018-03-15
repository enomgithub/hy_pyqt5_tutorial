#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtCore [Qt]])
(import [PyQt5.QtWidgets [QWidget QLCDNumber QSlider QVBoxLayout
                          QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))

    ;; 7セグ風の数値表示ウィジェットの作成
    (setv lcd (QLCDNumber self))

    ;; スライダウィジェットの作成
    ;; デフォルト値: 0
    ;; 範囲: 0 - 99
    ;; ステップ: 1
    (setv sld (QSlider (. Qt Horizontal) self))

    (setv vbox (QVBoxLayout))
    ((. vbox addWidget) lcd)
    ((. vbox addWidget) sld)

    ((. self setLayout) vbox)

    ;; スライダの値が変更されたら、
    ;; lcdの表示を更新するように設定する
    ((. sld valueChanged connect) (. lcd display))

    ((. self setGeometry) 300 300 250 150)
    ((. self setWindowTitle) "Signal and slot")
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
