#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QMessageBox QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (.setGeometry self 300 300 250 150)
    (.setWindowTitle self "Message box")
    (.show self))

  (defn closeEvent [self event]
    (setv reply (.question QMessageBox self "Message" "本当に終了しますか？"
                 (| QMessageBox.Yes QMessageBox.No) QMessageBox.No))
    (if (= reply QMessageBox.Yes)
      (.accept event)
      (.ignore event))))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
