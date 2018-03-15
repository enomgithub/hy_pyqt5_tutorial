#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QMessageBox QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))

    ((. self setGeometry) 300 300 250 150)
    ((. self setWindowTitle) "Message box")
    None)

  (defn closeEvent [self event]
    (setv reply ((. QMessageBox question) self
                                          "Message" "本当に終了しますか？"
                                          (| (. QMessageBox Yes)
                                             (. QMessageBox No))
                                          (. QMessageBox No)))
    (if (= reply (. QMessageBox Yes))
        ((. event accept))
        ((. event ignore)))
    None))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  ((. ex show))
  ((. app exec_))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
