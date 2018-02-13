#!/usr/bin/env hy
;;;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QProgressBar QPushButton QApplication]])
(import [PyQt5.QtCore [QBasicTimer]])


(defclass Example [QWidget]
  "
  :type progress-bar: QProgressBar
  :type button: QPushButton
  :type timer: QBasicTimer
  "
  (defn --init-- [self]
    "
    :return: None
    "
    ((. (super) --init--))

    (setv (. self progress-bar) (QProgressBar self))
    ((. self progress-bar setGeometry) 30 40 200 25)

    (setv (. self button) (QPushButton "開始" self))
    ((. self button move) 40 80)
    ((. self button clicked connect) (. self do-action))

    (setv (. self timer) (QBasicTimer))
    (setv (. self step) 0)

    ((. self setGeometry) 300 300 280 170)
    ((. self setWindowTitle) "QProgressBar")
    None)

  (defn timerEvent [self event]
    "
    :param event: PyQt5.QtCore.QEvent
    :return: None
    "
    (if (>= (. self step) 100)
        (do ((. self timer stop))
            ((. self button setText) "完了"))
        (do (setv (. self step) (+ (. self step) 1))
            ((. self progress-bar setValue) (. self step))))
    None)

  (defn do-action [self]
    "
    :return: None
    "
    (if ((. self timer isActive))
        (do ((. self timer stop))
            ((. self button setText) "開始"))
        (do ((. self timer start) 100 self)
            ((. self button setText) "停止")))
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
