#!/usr/bin/env hy
;;;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QCalendarWidget QLabel QApplication
                          QVBoxLayout]])
(import [PyQt5.QtCore [QDate]])


(defclass Example [QWidget]
  "
  :type label: QLabel
  "
  (defn --init-- [self]
    "
    :return: None
    "
    ((. (super) --init--))

    (setv vbox (QVBoxLayout self))

    (setv cal (QCalendarWidget self))
    ((. cal setGridVisible) True)
    ((. cal clicked [QDate] connect) (. self show-date))

    (setv (. self label) (QLabel self))
    (setv date ((. cal selectedDate)))
    ((. self label setText) ((. date toString) "yyyy年MM月dd日 (ddd)"))

    ((. vbox addWidget) cal)
    ((. vbox addWidget) (. self label))

    ((. self setLayout) vbox)
    ((. self setGeometry) 300 300 350 300)
    ((. self setWindowTitle) "Calendar")
    None)

  (defn show-date [self date]
    "
    :param date: QDate
    :return: None
    "
    ((. self label setText) ((. date toString) "yyyy年MM月dd日 (ddd)"))
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
