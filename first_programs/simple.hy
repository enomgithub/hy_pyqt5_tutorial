#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QApplication QWidget]])


(defn main []
  (setv app (QApplication sys.argv))
  (setv w (QWidget))
  (.resize w 250 150)
  (.move w 300 300)
  (.setWindowTitle w "Simple")
  (.show w)
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
