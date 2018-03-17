#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QApplication]])
(import [PyQt5.QtGui [QPainter QPainterPath]])
(import [PyQt5.QtCore [Qt]])


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
    ((. self setGeometry) 300 300 380 250)
    ((. self setWindowTitle) "Bezier curve")
    None)

  (defn paintEvent [self event]
    "
    :param event: PyQt5.QtCore.QEvent
    :return: None
    "
    ((. self painter begin) self)
    ((. self painter setRenderHint) (. QPainter Antialiasing))
    ((. self draw-bezier-curve))
    ((. self painter end))
    None)

  (defn draw-bezier-curve [self]
    "
    :return: None
    "
    (setv path (QPainterPath))
    ((. path moveTo) 30 30)
    ((. path cubicTo) 30 30 200 350 350 30)
    ((. self painter drawPath) path)
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
