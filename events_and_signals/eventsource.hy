#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QMainWindow QPushButton QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv btn1 (QPushButton "Button 1" self))
    ((. btn1 move) 30 50)

    (setv btn2 (QPushButton "Button 2" self))
    ((. btn2 move) 150 50)

    ((. btn1 clicked connect) (. self button-clicked))
    ((. btn2 clicked connect) (. self button-clicked))

    ((. self statusBar))

    ((. self setGeometry) 300 300 290 150)
    ((. self setWindowTitle) "Event sender")
    None)

  (defn button-clicked [self]
    (setv sender ((. self sender)))
    ((. (.statusBar self) showMessage) (+ ((. sender text)) " was pressed"))
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
