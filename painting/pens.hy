#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QApplication]])
(import [PyQt5.QtGui [QPainter QPen]])
(import [PyQt5.QtCore [Qt]])


(setv *patterns* (, (. Qt SolidLine) (. Qt DashLine) (. Qt DashDotLine)
                    (. Qt DotLine) (. Qt DashDotDotLine) (. Qt CustomDashLine)))


(defclass Example [QWidget]
  "
  :type painter: QPainter
  "
  (defn --init-- [self]
    "
    :return: None
    "
    ((. (super) --init--))
    (setv (. self painter) (QPainter))
    ((. self setGeometry) 300 300 280 270)
    ((. self setWindowTitle) "Pen styles")
    None)

  (defn paintEvent [self event]
    "
    :param event: PyQt5.QtCore.QEvent
    :return: None
    "
    ((. self painter begin) self)
    ((. self draw-line))
    ((. self painter end))
    None)

  (defn draw-line [self]
    "
    :return: None
    "
    (setv pen (QPen (. Qt black) 2))
    (for [(, i pattern) (enumerate *patterns*)]
      (setv height (* 40 (+ i 1)))
      ((. pen setStyle) pattern)
      (if (= pattern Qt.CustomDashLine)
        ((. pen setDashPattern) [1 4 5 4]))
      ((. self painter setPen) pen)
      ((. self painter drawLine) 20 height 250 height))
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
