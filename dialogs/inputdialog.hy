#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QPushButton QLineEdit QInputDialog
                          QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv self.btn (QPushButton "Dialog" self))
    ((. self btn move) 20 20)

    ;; ボタンをクリックすると
    ;; ダイアログが表示されるように設定する
    ((. self btn clicked connect) (. self show-dialog))

    (setv self.le (QLineEdit self))
    ((. self le move) 130 22)

    ((. self setGeometry) 300 300 290 150)
    ((. self setWindowTitle) "Input dialog")
    None)

  (defn show-dialog [self]
    (setv (, text ok)
          ((. QInputDialog getText) self "Input Dialog" "Enter your name:"))

    ;; OKボタンを押したら、入力したテキストを
    ;; 元のウインドウの入力欄へ入力する
    (when ok
          ((. self le setText) (str text)))
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
