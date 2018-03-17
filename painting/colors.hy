#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QApplication]])
(import [PyQt5.QtGui [QPainter QColor QBrush]])


(setv *colors* [(, 200 0 0 ) (, 255 80 0 160) (, 25 0 90 200)])


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
    ((. self setGeometry) 300 300 350 100)
    ((. self setWindowTitle) "Colors")
    None)

  (defn paintEvent [self event]
    "
    :param event: PyQt5.QtCore.QEvent
    :return: None
    "
    ((. self painter begin) self)
    ((. self draw-rectangles))
    ((. self painter end))
    None)

  (defn draw-rectangles [self]
    "
    :return: None
    "
    (setv color (QColor 0 0 0))
    ((. color setNamedColor) "#d4d4d4")
    ((. self painter setPen) color)

    (for [(, i col) (enumerate *colors*)]
      ((. self painter setBrush) (apply QColor col))
      ((. self painter drawRect) (+ 10 (* 120 i)) 15 90 60))
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


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
