#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QPushButton qApp QApplication]])
(import [PyQt5.QtCore [QCoreApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv qbtn (QPushButton "Quit" self))
    (.clicked.connect qbtn qApp.quit)
    (.resize qbtn (.sizeHint qbtn))
    (.move qbtn 50 50)

    (.setGeometry self 300 300 250 150)
    (.setWindowTitle self "Quit button")
    (.show self)))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
