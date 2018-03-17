#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QLabel QLineEdit QTextEdit QGridLayout
                          QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv title (QLabel "Title"))
    (setv author (QLabel "Author"))
    (setv review (QLabel "Review"))

    ;; QLineEditは1行のテキスト入力欄
    ;; QTextEditは複数行のテキスト入力欄
    (setv title-edit (QLineEdit))
    (setv author-edit (QLineEdit))
    (setv review-edit (QTextEdit))

    ;; グリッド状のレイアウトを作成し、
    ;; 10のグリッドを設定する
    (setv grid (QGridLayout))
    ((. grid setSpacing) 10)

    ((. grid addWidget) title 1 0)
    ((. grid addWidget) title-edit 1 1)

    ((. grid addWidget) author 2 0)
    ((. grid addWidget) author-edit 2 1)

    ;; review-editにはグリッド3つ分を割り当てる
    ((. grid addWidget) review 3 0)
    ((. grid addWidget) review-edit 3 1 5 1)

    ((. self setLayout) grid)

    ((. self setGeometry) 300 300 350 300)
    ((. self setWindowTitle) "Review")
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
