#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QMainWindow QPushButton QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv btn1 (QPushButton "Button 1" self))
    (.move btn1 30 50)

    (setv btn2 (QPushButton "Button 2" self))
    (.move btn2 150 50)

    ((. btn1 clicked connect) (. self button-clicked))
    ((. btn2 clicked connect) (. self button-clicked))

    (.statusBar self)

    (.setGeometry self 300 300 290 150)
    (.setWindowTitle self "Event sender")
    (.show self))

  (defn button-clicked [self]
    (setv sender (.sender self))
    ((. (.statusBar self) showMessage) (+ (.text sender) " was pressed"))))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
