#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QGridLayout QPushButton QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
      ;; グリッド状のレイアウトを作成し、
      ;; 親ウィジェット内に配置する
      (setv grid (QGridLayout))
      ((. self setLayout) grid)

      (setv names ["Cls" "Bck" "" "Close"
                   "7" "8" "9" "/"
                   "4" "5" "6" "*"
                   "1" "2" "3" "-"
                   "0" "." "=" "+"])
      (setv positions (list-comp (, i j) (i (range 5) j (range 4))))

      ;; グリッド状のレイアウトに各ボタンを配置する
      (for [(, (, i j) name) (zip positions names)]
        (when (= name "")
              (continue))
        (setv button (QPushButton name))
        ((. grid addWidget) button i j))

      ((. self move) 300 150)
      ((. self setWindowTitle) "Calculator")
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
