#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)
(import [PyQt5.QtWidgets [QApplication QWidget]])
(import [PyQt5.QtGui [QIcon]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (.setGeometry self 300 300 300 220)
    (.setWindowTitle self "Icon")
    (.setWindowIcon self (QIcon "../src/cat.png"))
    (.show self)))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
