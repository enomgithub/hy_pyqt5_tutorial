#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QPushButton QHBoxLayout QVBoxLayout
                          QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    ; ボタンを作成する
    (setv ok-button (QPushButton "OK"))
    (setv cancel-button (QPushButton "Cancel"))

    ; 子ウィジェットを水平配置する箱を作成し、
    ; 伸縮する空白（ストレッチ）と二つのボタンを箱内に配置する
    (setv hbox (QHBoxLayout))
    (.addStretch hbox 1)
    (.addWidget hbox ok-button)
    (.addWidget hbox cancel-button)

    ; 子ウィジェットを垂直配置する箱を作成し、
    ; 水平配置する箱をその中に配置する
    (setv vbox (QVBoxLayout))
    (.addStretch vbox)
    (.addLayout vbox hbox)

    ; 子ウィジェットを垂直配置する箱を、
    ; 親ウィジェット内に配置する
    (.setLayout self vbox)

    (.setGeometry self 300 300 300 150)
    (.setWindowTitle self "Buttons")
    (.show self)))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
