#!/usr/bin/env hy
;;;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QCheckBox QApplication]])
(import [PyQt5.QtCore [Qt]])


(defclass Example [QWidget]
  (defn --init-- [self]
    "
    :return: None
    "
    ((. (super) --init--))

    (setv cb (QCheckBox "Show title" self))
    ((. cb move) 20 20)
    ((. cb toggle))
    ((. cb stateChanged connect) (. self change-title))

    ((. self setGeometry) 300 300 250 150)
    ((. self setWindowTitle) "QCheckBox")
    None)

  (defn change-title [self state]
    "
    :param state: Qt.CheckState
    :return: None
    "
    (if (= state (. Qt Checked))
        ((. self setWindowTitle) "QCheckBox")
        ((. self setWindowTitle) ""))
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
