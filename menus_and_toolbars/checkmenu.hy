#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QMainWindow QAction QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv (. self statusbar) ((. self statusBar)))
    ((. self statusbar showMessage) "Ready")

    (setv menubar ((. self menuBar)))
    (setv view-menu ((. menubar addMenu) "View"))

    (setv view-stat-act (QAction "View statusbar" self :checkable True))
    ((. view-stat-act setStatusTip) "View statusbar")
    ((. view-stat-act setChecked) True)
    ((. view-stat-act triggered connect) (. self toggle-menu))

    ((. view-menu addAction) view-stat-act)

    ((. self setGeometry) 300 300 300 200)
    ((. self setWindowTitle) "Check menu")
    None)

  (defn toggle-menu [self state]
    (if (= state True)
        ((. self statusbar show))
        ((. self statusbar hide)))
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
