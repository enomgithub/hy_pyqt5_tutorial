#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QMainWindow QAction QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv self.statusbar (.statusBar self))
    (.statusbar.showMessage self "Ready")

    (setv menubar (.menuBar self))
    (setv view-menu (.addMenu menubar "View"))

    (setv view-stat-act (QAction "View statusbar" self :checkable True))
    (.setStatusTip view-stat-act "View statusbar")
    (.setChecked view-stat-act True)
    (.triggered.connect view-stat-act self.toggle-menu)

    (.addAction view-menu view-stat-act)

    (.setGeometry self 300 300 300 200)
    (.setWindowTitle self "Check menu")
    (.show self))

  (defn toggle-menu [self state]
    (if (= state True)
      (.show self.statusbar)
      (.hide self.statusbar))))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
