#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtCore [Qt]])
(import [PyQt5.QtWidgets [QWidget QApplication QGridLayout QLabel]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv grid (QGridLayout))
    (setv x 0)
    (setv y 0)

    (setv (. self text) ((. "x: {0}, y: {1}" format) x y))

    (setv (. self label) (QLabel (. self text) self))
    ((. grid addWidget) (. self label) 0 0 (. Qt AlignTop))

    ;; マウストラッキングを有効にする
    ;; デフォルトでは無効
    ((. self setMouseTracking) True)

    ((. self setLayout) grid)

    ((. self setGeometry) 300 300 350 200)
    ((. self setWindowTitle) "Event object")
    None)

  ;; ウィジェット上をマウスが移動したら、
  ;; カーソルの座標を取得し、表示する。
  (defn mouseMoveEvent [self e]
    (setv x ((. e x)))
    (setv y ((. e y)))

    (setv text ((. "x: {0}, y: {1}" format) x y))
    ((. self label setText) text)
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
