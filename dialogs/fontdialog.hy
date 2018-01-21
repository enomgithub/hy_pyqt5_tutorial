#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QVBoxLayout QPushButton QSizePolicy
                          QLabel QFontDialog QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv vbox (QVBoxLayout))

    (setv btn (QPushButton "Dialog" self))
    ((. btn setSizePolicy) (. QSizePolicy Fixed) (. QSizePolicy Fixed))
    ((. btn move) 20 20)
    ((. btn clicked connect) (. self show-dialog))

    (setv self.lbl (QLabel "Knowledge only matters" self))
    ((. self lbl move) 130 20)

    ((. vbox addWidget) btn)
    ((. vbox addWidget) (. self lbl))
    ((. self setLayout) vbox)

    ((. self setGeometry) 300 300 250 180)
    ((. self setWindowTitle) "Font dialog")
    (.show self))

  (defn show-dialog [self]
    (setv (, font ok) (.getFont QFontDialog))

    ; OKボタンを押したら、self.lblに
    ; フォント設定を適用する
    (if ok
      ((. self lbl setFont) font))))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
