#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtCore [pyqtSignal QObject]])
(import [PyQt5.QtWidgets [QMainWindow QApplication]])


(defclass Communicate [QObject]
  (setv close-app (pyqtSignal)))


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv (. self c) (Communicate))
    ((. (. self c close-app) connect) (. self close))

    ((. self setGeometry) 300 300 290 150)
    ((. self setWindowTitle) "Emit signal")
    None)

  ;; マウスをクリックするとウインドウを閉じるように設定する
  ;; クリックするボタンは問わない
  (defn mousePressEvent [self event]
    ((. (. self c close-app) emit))
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
