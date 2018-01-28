#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QApplication]])
(import [PyQt5.QtGui [QPainter QColor QFont]])
(import [PyQt5.QtCore [Qt]])


(defclass Example [QWidget]
  "
  :type painter: QPainter
  "
  (defn --init-- [self]
    "
    :return: None
    "
    (.--init-- (super))

    ; init UI
    (setv (. self painter) (QPainter))
    (setv (. self text) "こんにちは、世界")
    ((. self setGeometry) 300 300 280 170)
    ((. self setWindowTitle) "Drawing text")
    None)

  (defn paintEvent [self event]
    "
    :param event: PyQt5.QtCore.QEvent
    :return: None
    "
    ((. self painter begin) self)
    ((. self draw-text) event)
    ((. self painter end))
    None)

  (defn draw-text [self event]
    "
    :param event: PyQt5.QtCore.QEvent
    :return: None
    "
    ((. self painter setPen) (QColor 168 34 3))
    ((. self painter setFont) (QFont "Decorative" 10))
    ((. self painter drawText)
      ((. event rect)) (. Qt AlignCenter) (. self text))
    None))


(defn main []
  "
  :return: int
  "
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  ((. ex show))
  ((. app exec-))
  0)


(if (= --name-- "__main__")
  ((. sys exit) (main)))
