#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QMainWindow qApp QMenu QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (.setGeometry self 300 300 300 200)
    (.setWindowTitle self "Context menu")
    (.show self))

  (defn contextMenuEvent [self event]
    (setv cmenu (QMenu self))
    (setv new-act (.addAction cmenu "New"))
    (setv opn-act (.addAction cmenu "Open"))
    (setv quit-act (.addAction cmenu "Quit"))
    (setv action (.exec_ cmenu (.mapToGlobal self (.pos event))))

    (if (= action quit-act)
      (.quit qApp))))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
