#!/usr/bin/env hy
;;;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QSlider QLabel QApplication]])
(import [PyQt5.QtCore [Qt]])
(import [PyQt5.QtGui [QPixmap]])


(setv *dir* "../src/")
(setv *name* {"mute" "mute24"
              "min" "min24"
              "med" "med24"
              "max" "max24"})
(setv *extension* ".png")


(defclass Example [QWidget]
  "
  :type label: QLabel
  "
  (defn --init-- [self]
    "
    :return: None
    "
    ((. (super) --init--))

    (setv slider (QSlider (. Qt Horizontal) self))
    ((. slider setFocusPolicy) (. Qt NoFocus))
    ((. slider setGeometry) 30 40 100 30)
    ((. slider valueChanged [int] connect) (. self change-value))

    (setv (. self label) (QLabel self))
    ((. self label setPixmap)
     (QPixmap (+ *dir* (. *name* ["mute"]) *extension*)))
    ((. self label setGeometry) 160 40 80 30)

    ((. self setGeometry) 300 300 280 170)
    ((. self setWindowTitle) "QSlider")
    None)

  (defn change-value [self value]
    "
    :param value: int
    :return: None
    "
    (cond [(= value 0)
           ((. self label setPixmap)
            (QPixmap (+ *dir* (. *name* ["mute"]) *extension*)))]
          [(and (> value 0) (<= value 30))
           ((. self label setPixmap)
            (QPixmap (+ *dir* (. *name* ["min"]) *extension*)))]
          [(and (> value 30) (< value 80))
           ((. self label setPixmap)
            (QPixmap (+ *dir* (. *name* ["med"]) *extension*)))]
          [True
           ((. self label setPixmap)
            (QPixmap (+ *dir* (. *name* ["max"]) *extension*)))])
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
