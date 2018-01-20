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
      (setv exit-act (QAction (QIcon "exit.png") "&Exit" self))
      (.setShortcut exit-act "Ctrl+Q")
      (.setStatusTip exit-act "Exit application")
      (.triggered.connect exit-act qApp.quit)

      (.statusBar self)

      (setv menubar (.menuBar self))
      (setv file-menu (.addMenu menubar "&File"))
      (.addAction file-menu exit-act)

      (.setGeometry self 300 300 300 200)
      (.setWindowTitle self "Simple menu")
      (.show self)))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
