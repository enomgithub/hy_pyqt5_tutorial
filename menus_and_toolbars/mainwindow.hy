#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QMainWindow QTextEdit QAction QApplication]])
(import [PyQt5.QtGui [QIcon]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv text-edit (QTextEdit))
    (.setCentralWidget self text-edit)

    (setv exit-act (QAction (QIcon "../src/exit24.png") "Exit" self))
    (.setShortcut exit-act "Ctrl+Q")
    (.setStatusTip exit-act "Exit application")
    ((. exit-act triggered connect) (. self close))

    (.statusBar self)

    (setv menubar (.menuBar self))
    (setv file-menu (.addMenu menubar "&File"))
    (.addAction file-menu exit-act)

    (setv toolbar (.addToolBar self "Exit"))
    (.addAction toolbar exit-act)

    (.setGeometry self 300 300 350 250)
    (.setWindowTitle self "Main window")
    (.show self)))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
