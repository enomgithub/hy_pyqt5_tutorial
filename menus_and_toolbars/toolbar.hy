#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QMainWindow QAction qApp QApplication]])
(import [PyQt5.QtGui [QIcon]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv exit-act (QAction (QIcon "../src/exit24.png") "Exit" self))
    ((. exit-act setShortcut) "Ctrl+Q")
    ((. exit-act triggered connect) (. qApp quit))

    (setv (. self toolbar) ((. self addToolBar) "Exit"))
    ((. self toolbar addAction) exit-act)

    ((. self setGeometry) 300 300 300 200)
    ((. self setWindowTitle) "Toolbar")
    None))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  ((. ex show))
  ((. app exec_))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
