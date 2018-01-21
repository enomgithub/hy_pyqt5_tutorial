#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtCore [Qt]])
(import [PyQt5.QtWidgets [QWidget QApplication QGridLayout QLabel]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv grid (QGridLayout))
    (setv x 0)
    (setv y 0)

    (setv self.text ((. "x: {0}, y: {1}" format) x y))

    (setv self.label (QLabel self.text self))
    (.addWidget grid self.label 0 0 Qt.AlignTop)

    ; マウストラッキングを有効にする
    ; デフォルトでは無効
    (.setMouseTracking self True)

    (.setLayout self grid)

    (.setGeometry self 300 300 350 200)
    (.setWindowTitle self "Event object")
    (.show self))

  ; ウィジェット上をマウスが移動したら、
  ; カーソルの座標を取得し、表示する。
  (defn mouseMoveEvent [self e]
    (setv x (.x e))
    (setv y (.y e))

    (setv text ((. "x: {0}, y: {1}" format) x y))
    ((. self label setText) text)))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
