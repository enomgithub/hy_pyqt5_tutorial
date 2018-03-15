#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QApplication QWidget]])


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv w (QWidget))
  ((. w resize) 250 150)
  ((. w move) 300 300)
  ((. w setWindowTitle) "Simple")
  ((. w show))
  ((. app exec_))
  0)


(when (= --name-- "__main__")
      (import sys)
      ((. sys exit) (main)))
