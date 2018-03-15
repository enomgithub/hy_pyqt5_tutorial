#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QPushButton qApp QApplication]])
(import [PyQt5.QtCore [QCoreApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv qbtn (QPushButton "Quit" self))
    ((. qbtn clicked connect) (. qApp quit))
    ((. qbtn resize) ((. qbtn sizeHint)))
    ((. qbtn move) 50 50)

    ((. self setGeometry) 300 300 250 150)
    ((. self setWindowTitle) "Quit button")
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
