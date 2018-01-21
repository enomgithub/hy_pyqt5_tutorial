#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtCore [pyqtSignal QObject]])
(import [PyQt5.QtWidgets [QMainWindow QApplication]])


(defclass Communicate [QObject]
  (setv close-app (pyqtSignal)))


(defclass Example [QMainWindow]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv self.c (Communicate))
    (.connect (. self c close-app) (. self close))

    (.setGeometry self 300 300 290 150)
    (.setWindowTitle self "Emit signal")
    (.show self))

  ; マウスをクリックするとウインドウを閉じるように設定する
  ; クリックするボタンは問わない
  (defn mousePressEvent [self event]
    (.emit (. self c close-app))
    None))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
