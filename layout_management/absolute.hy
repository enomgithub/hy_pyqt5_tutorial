#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
;; ラベルウィジェットを絶対座標で配置する例
(import [PyQt5.QtWidgets [QWidget QLabel QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv lbl1 (QLabel "Zetcode" self))
    ((. lbl1 move) 15, 10)

    (setv lbl2 (QLabel "Tutorials" self))
    ((. lbl2 move) 35 40)

    (setv lbl3 (QLabel "for programmers" self))
    ((. lbl3 move) 55 70)

    ((. self setGeometry) 300 300 250 150)
    ((. self setWindowTitle) "Absolute")
    None))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  ((. ex show))
  ((. app exec-))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
