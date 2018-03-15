#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QApplication QWidget]])
(import [PyQt5.QtGui [QIcon]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    ((. self setGeometry) 300 300 300 220)
    ((. self setWindowTitle) "Icon")
    ((. self setWindowIcon) (QIcon "../src/cat.png"))
    None))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  ((. ex show))
  ((. app exec_))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
