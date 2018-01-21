#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QLabel QLineEdit QTextEdit QGridLayout
                          QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv title (QLabel "Title"))
    (setv author (QLabel "Author"))
    (setv review (QLabel "Review"))

    ; QLineEditは1行のテキスト入力欄
    ; QTextEditは複数行のテキスト入力欄
    (setv title-edit (QLineEdit))
    (setv author-edit (QLineEdit))
    (setv review-edit (QTextEdit))

    ; グリッド状のレイアウトを作成し、
    ; 10のグリッドを設定する
    (setv grid (QGridLayout))
    (.setSpacing grid 10)

    (.addWidget grid title 1 0)
    (.addWidget grid title-edit 1 1)

    (.addWidget grid author 2 0)
    (.addWidget grid author-edit 2 1)

    ; review-editにはグリッド3つ分を割り当てる
    (.addWidget grid review 3 0)
    (.addWidget grid review-edit 3 1 5 1)

    (.setLayout self grid)

    (.setGeometry self 300 300 350 300)
    (.setWindowTitle self "Review")
    (.show self)))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
