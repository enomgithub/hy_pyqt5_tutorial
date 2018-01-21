#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QGridLayout QPushButton QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

    (defn initUI [self]
      ; グリッド状のレイアウトを作成し、
      ; 親ウィジェット内に配置する
      (setv grid (QGridLayout))
      (.setLayout self grid)

      (setv names ["Cls" "Bck" "" "Close"
                   "7" "8" "9" "/"
                   "4" "5" "6" "*"
                   "1" "2" "3" "-"
                   "0" "." "=" "+"])
      (setv positions (list-comp (, i j) (i (range 5) j (range 4))))

      ; グリッド状のレイアウトに各ボタンを配置する
      (for [(, (, i j) name) (zip positions names)]
        (if (= name "")
          (continue))
        (setv button (QPushButton name))
        (.addWidget grid button i j))

      (.move self 300 150)
      (.setWindowTitle self "Calculator")
      (.show self)))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
