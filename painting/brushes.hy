#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QApplication]])
(import [PyQt5.QtGui [QPainter QBrush]])
(import [PyQt5.QtCore [Qt]])


(setv *patterns* (, (. Qt SolidPattern) (. Qt Dense1Pattern)
                    (. Qt Dense2Pattern) (. Qt Dense3Pattern)
                    (. Qt Dense4Pattern) (. Qt Dense5Pattern)
                    (. Qt Dense6Pattern) (. Qt Dense7Pattern)
                    (. Qt DiagCrossPattern) (. Qt HorPattern)
                    (. Qt VerPattern) (. Qt BDiagPattern)))


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
    ((. self setGeometry) 300 300 470 270)
    ((. self setWindowTitle) "Brushes")
    None)

  (defn paintEvent [self event]
    "
    :param event: PyQt5.QtCore.QEvent
    :return: None
    "
    ((. self painter begin) self)
    ((. self draw-brushes))
    ((. self painter end))
    None)

  (defn draw-brushes [self]
    "
    :return: None
    "
    (setv brush (QBrush))
    (for [(, i pattern) (enumerate *patterns*)]
      ((. brush setStyle) pattern)
      ((. self painter setBrush) brush)
      ((. self painter drawRect) (+ 10 (* 120 (% i 4))) (+ 15 (* 90 (// i 4)))
                                  90 60))
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
