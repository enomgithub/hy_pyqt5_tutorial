#!/usr/bin/env hy
; -*- coding: utf-8 -*-
; ラベルウィジェットを絶対座標で配置する例
(import sys)

(import [PyQt5.QtWidgets [QWidget QLabel QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv lbl1 (QLabel "Zetcode" self))
    (.move lbl1 15, 10)

    (setv lbl2 (QLabel "Tutorials" self))
    (.move lbl2 35 40)

    (setv lbl3 (QLabel "for programmers" self))
    (.move lbl3 55 70)

    (.setGeometry self 300 300 250 150)
    (.setWindowTitle self "Absolute")
    (.show self)))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
