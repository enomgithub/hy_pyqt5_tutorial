#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtCore [Qt]])
(import [PyQt5.QtWidgets [QWidget QWidget QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    ((. self setGeometry) 300 300 250 150)
    ((. self setWindowTitle) "Event handler")
    None)

  ;; keyPressEventは戻り値がNone、
  ;; closeメソッドは戻り値がboolなので、
  ;; HyではNoneを明記する必要がある
  (defn keyPressEvent [self e]
    (when (= ((. e key)) (. Qt Key-Escape))
          ((. self close)))
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
