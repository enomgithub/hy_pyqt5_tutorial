#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QMainWindow QTextEdit QAction QApplication]])
(import [PyQt5.QtGui [QIcon]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv text-edit (QTextEdit))
    ((. self setCentralWidget) text-edit)

    (setv exit-act (QAction (QIcon "../src/exit24.png") "Exit" self))
    ((. exit-act setShortcut) "Ctrl+Q")
    ((. exit-act setStatusTip) "Exit application")
    ((. exit-act triggered connect) (. self close))

    ((. self statusBar))

    (setv menubar ((. self menuBar)))
    (setv file-menu ((. menubar addMenu) "&File"))
    ((. file-menu addAction) exit-act)

    (setv toolbar ((. self addToolBar) "Exit"))
    ((. toolbar addAction) exit-act)

    ((. self setGeometry) 300 300 350 250)
    ((. self setWindowTitle) "Main window")
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
