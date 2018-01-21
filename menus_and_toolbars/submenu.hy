#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QMainWindow QAction QMenu QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv menubar (.menuBar self))
    (setv file-menu (.addMenu menubar "File"))

    (setv imp-menu (QMenu "Import" self))
    (setv imp-act (QAction "Import mail" self))
    (.addAction imp-menu imp-act)

    (setv new-act (QAction "New" self))

    (.addAction file-menu new-act)
    (.addMenu file-menu imp-menu)

    (.setGeometry self 300 300 300 200)
    (.setWindowTitle self "Submenu")
    (.show self)))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
