#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import random)
(import sys)

(import [PyQt5.QtWidgets [QWidget QApplication ]])
(import [PyQt5.QtGui [QPainter]])
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

    ; init UI
    (setv (. self painter) (QPainter))
    ((. self setGeometry) 300 300 300 190)
    ((. self setWindowTitle) "Points")
    None)

  (defn paintEvent [self event]
    "
    :param event: PyQt5.QtCore.QEvent
    :return: None
    "
    ((. self painter begin) self)
    ((. self draw-points))
    ((. self painter end))
    None)

  (defn get-random-xy [self]
    "
    :yield: (int, int)
    "
    (while True
      (yield
        (, ((. random randint) 1 (- ((. ((. self size)) width)) 1))
           ((. random randint) 1 (- ((. ((. self size)) height)) 1))))))

  (defn draw-points [self]
    "
    :return: None
    "
    ((. self painter setPen) (. Qt red))

    (try
      (for [(, x y) (take 1000 ((. self get-random-xy)))]
        ((. self painter drawPoint) x y))
      (except [ValueError]
        (print "描画失敗")))
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
