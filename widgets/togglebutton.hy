#!/usr/bin/env hy
;;;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QPushButton QFrame QApplication]])
(import [PyQt5.QtGui [QColor]])


(defclass Example [QWidget]
  "
  :type col: QColor
  :type square: QFrame
  "
  (defn --init-- [self]
    "
    :return: None
    "
    ((. (super) --init--))

    (setv (. self col) (QColor 0 0 0))

    (setv red-button (QPushButton "赤" self))
    ((. red-button setCheckable) True)
    ((. red-button move) 10 10)
    ((. red-button clicked [bool] connect) (. self set-color))

    (setv green-button (QPushButton "緑" self))
    ((. green-button setCheckable) True)
    ((. green-button move) 10 60)
    ((. green-button clicked [bool] connect) (. self set-color))

    (setv blue-button (QPushButton "青" self))
    ((. blue-button setCheckable) True)
    ((. blue-button move) 10 110)
    ((. blue-button clicked [bool] connect) (. self set-color))

    (setv (. self square) (QFrame self))
    ((. self square setGeometry) 150 20 100 100)
    ((. self square setStyleSheet) (% "QWidget { background-color: %s }"
                                      ((. self col name))))
    ((. self setGeometry) 300 300 280 170)
    ((. self setWindowTitle) "Toggle button")
    None)

  (defn set-color [self pressed]
    "
    :param pressed: bool
    :return: None
    "
    (setv source ((. self sender)))
    (if pressed
        (setv val 255)
        (setv val 0))
    (cond [(= ((. source text)) "赤") ((. self col setRed) val)]
          [(= ((. source text)) "緑") ((. self col setGreen) val)]
          [True ((. self col setBlue) val)])
    ((. self square setStyleSheet) (% "QFrame { background-color: %s }"
                                      ((. self col name))))
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
