#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QPushButton QLineEdit QInputDialog
                          QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv self.btn (QPushButton "Dialog" self))
    ((. self btn move) 20 20)

    ; ボタンをクリックすると
    ; ダイアログが表示されるように設定する
    ((. self btn clicked connect) (. self show-dialog))

    (setv self.le (QLineEdit self))
    ((. self le move) 130 22)

    (.setGeometry self 300 300 290 150)
    (.setWindowTitle self "Input dialog")
    (.show self))

  (defn show-dialog [self]
    (setv (, text ok)
      ((. QInputDialog getText) self "Input Dialog" "Enter your name:"))

    ; OKボタンを押したら、入力したテキストを
    ; 元のウインドウの入力欄へ入力する
    (if ok
      ((. self le setText) (str text)))))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
