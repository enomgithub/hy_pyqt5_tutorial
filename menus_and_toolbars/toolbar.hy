#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QMainWindow QAction qApp QApplication]])
(import [PyQt5.QtGui [QIcon]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv exit-act (QAction (QIcon "exit24.png") "Exit" self))
    (.setShortcut exit-act "Ctrl+Q")
    ((. exit-act triggered connect) (. qApp quit))

    (setv self.toolbar (.addToolBar self "Exit"))
    ((. self toolbar addAction) exit-act)

    (.setGeometry self 300 300 300 200)
    (.setWindowTitle self "Toolbar")
    (.show self)))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
