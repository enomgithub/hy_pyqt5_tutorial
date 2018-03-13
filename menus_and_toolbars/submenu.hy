#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QMainWindow QAction QMenu QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv menubar ((. self menuBar)))
    (setv file-menu ((. menubar addMenu) "File"))

    (setv imp-menu (QMenu "Import" self))
    (setv imp-act (QAction "Import mail" self))
    ((. imp-menu addAction) imp-act)

    (setv new-act (QAction "New" self))

    ((. file-menu addAction) new-act)
    ((. file-menu addMenu) imp-menu)

    ((. self setGeometry) 300 300 300 200)
    ((. self setWindowTitle) "Submenu")
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
