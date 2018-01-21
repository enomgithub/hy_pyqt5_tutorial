#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtCore [Qt]])
(import [PyQt5.QtWidgets [QWidget QWidget QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (.setGeometry self 300 300 250 150)
    (.setWindowTitle self "Event handler")
    (.show self))

  ; keyPressEventは戻り値がNone、
  ; closeメソッドは戻り値がboolなので、
  ; HyではNoneを明記する必要がある
  (defn keyPressEvent [self e]
    (if (= (.key e) (. Qt Key-Escape))
      (do
        (.close self)
        None))))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
