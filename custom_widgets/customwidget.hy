#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QSlider QApplication
                          QHBoxLayout QVBoxLayout]])
(import [PyQt5.QtGui [QPainter QFont QColor QPen]])
(import [PyQt5.QtCore [QObject Qt pyqtSignal]])


(setv *white* (, 255 255 255))
(setv *cream* (, 255 255 184))
(setv *pale-red* (, 255 175 175))


(defclass Communicate [QObject]
  "
  :type update-bw: pyqtSignal
  "
  (setv update-bw (pyqtSignal int)))


(defclass BurningWidget [QWidget]
  "
  :type painter: QPainter
  :type max-value: int
  :type value: int
  :type threshold: int
  :type div: int
  :type font: QFont
  :type pen: QPen
  :type num: [int]
  "
  (defn --init-- [self &optional [max-value 750] [init-value 75] [threshold 700]
                                 [min-width 300] [min-height 30] [div 10]
                                 [font-size 7]]
    "
    :param max-value: int
    :param init-value: int
    :param threshold: int
    :param min-width: int
    :param min-height: int
    :param div: int
    :param font-size: int
    :return: None
    "
    (assert (and (<= init-value max-value) (< threshold max-value))
            "init_value <= max_value and threshold < max_value are required.")
    ((. (super) --init--))
    ((. self setMinimumSize) min-width min-height)

    (setv (. self painter) (QPainter))
    (setv (. self max-value) max-value)
    (setv (. self value) init-value)
    (setv (. self threshold) threshold)
    (setv (. self div) div)
    (setv (. self font) (QFont "Serif" font-size (. QFont Light)))
    (setv (. self pen) (QPen (QColor 20 20 20) 1 (. Qt SolidLine)))
    (setv (. self num)
          (list-comp (-> (. self max-value) (// (. self div)) (* (+ i 1)))
                     (i (range (-> (. self div) (- 1))))))
    None)

  (defn set-value [self value]
    "
    :param value: int
    :return: None
    "
    (setv (. self value) value)
    None)

  (defn paintEvent [self event]
    "
    :param event: QtCore.QEvent
    :return: None
    "
    ((. self painter begin) self)
    ((. self draw-widget))
    ((. self painter end))
    None)

  (defn draw-widget [self]
    "
    :return: None
    "
    ((. self painter setFont) (. self font))

    (setv size ((. self size)))
    (setv width ((. size width)))
    (setv height ((. size height)))

    (setv step (->> (. self div) (float) (/ width) (round) (int)))
    (setv till (-> width (/ (. self max-value)) (* (. self value)) (int)))
    (setv full (-> width (/ (. self max-value)) (* (. self threshold)) (int)))

    ((. self painter setPen) (apply QColor *white*))
    ((. self painter setBrush) (apply QColor *cream*))
    (if (>= (. self value) (. self threshold))
        (do ((. self painter drawRect) 0 0 full height)
            ((. self painter setPen) (apply QColor *pale-red*))
            ((. self painter setBrush) (apply QColor *pale-red*))
            ((. self painter drawRect) full 0 (- till full) height))
        ((. self painter drawRect) 0 0 till height))
    ((. self painter setPen) (. self pen))
    ((. self painter setBrush) (. Qt NoBrush))
    ((. self painter drawRect) 0 0 (- width 1) (- height 1))

    (setv j 0)
    (for [i (range step (* (. self div) step) step)]
         ((. self painter drawLine) i 0 i 5)
         (setv metrics ((. self painter fontMetrics)))
         (setv fw ((. metrics width) (str (get (. self num) j))))
         ((. self painter drawText) (- i (/ fw 2)) (/ height 2)
                                    (str (get (. self num) j)))
         (setv j (+ j 1)))
    None))


(defclass Example [QWidget]
  "
  :type slider: QSlider
  :type com: Communicate
  :type widget: BurningWidget
  "
  (defn --init-- [self]
    "
    :return: None
    "
    ((. (super) --init--))

    (setv max-value 750)
    (setv init-value 75)
    (setv threshold 700)

    (setv (. self slider) (QSlider (. Qt Horizontal) self))
    ((. self slider setFocusPolicy) (. Qt NoFocus))
    ((. self slider setRange) 1 max-value)
    ((. self slider setValue) init-value)
    ((. self slider setGeometry) 30 40 150 30)
    ((. (get (. self slider valueChanged) int) connect) (. self change-value))

    (setv (. self widget)
          (BurningWidget :max-value max-value
                         :init-value init-value
                         :threshold threshold))
    (setv (. self com) (Communicate))
    ((. (-> (. self com update-bw) (get  int)) connect)
     (. self widget set-value))

    (setv hbox (QHBoxLayout))
    ((. hbox addWidget) (. self widget))

    (setv vbox (QVBoxLayout))
    ((. vbox addStretch) 1)
    ((. vbox addLayout) hbox)
    ((. self setLayout) vbox)

    ((. self setGeometry) 300 300 390 210)
    ((. self setWindowTitle) "Burning widget")
    None)

  (defn change-value [self value]
    "
    :param value: int
    :return: None
    "
    ((. self com update-bw emit) value)
    ((. self widget repaint))
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
