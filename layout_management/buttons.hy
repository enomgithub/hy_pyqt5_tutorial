#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QPushButton QHBoxLayout QVBoxLayout
                          QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))

    ;; ボタンを作成する
    (setv ok-button (QPushButton "OK"))
    (setv cancel-button (QPushButton "Cancel"))

    ;; 子ウィジェットを水平配置する箱を作成し、
    ;; 伸縮する空白（ストレッチ）と二つのボタンを箱内に配置する
    (setv hbox (QHBoxLayout))
    ((. hbox addStretch) 1)
    ((. hbox addWidget) ok-button)
    ((. hbox addWidget) cancel-button)

    ;; 子ウィジェットを垂直配置する箱を作成し、
    ;; 水平配置する箱をその中に配置する
    (setv vbox (QVBoxLayout))
    ((. vbox addStretch))
    ((. vbox addLayout) hbox)

    ;; 子ウィジェットを垂直配置する箱を、
    ;; 親ウィジェット内に配置する
    ((. self setLayout) vbox)

    ((. self setGeometry) 300 300 300 150)
    ((. self setWindowTitle) "Buttons")
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
