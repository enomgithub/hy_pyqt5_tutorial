#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QMainWindow QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))

    ;; ステータスバーに Ready を表示
    ((. ((. self statusBar)) showMessage) "Ready")
    ((. self setGeometry) 300 300 250 150))
    None)


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  ((. ex show))
  ((. app exec_))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
