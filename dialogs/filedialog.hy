#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QMainWindow QTextEdit QAction QFileDialog
                          QApplication]])
(import [PyQt5.QtGui [QIcon]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv (. self text-edit) (QTextEdit))
    ((. self setCentralWidget) (. self text-edit))
    ((. self statusBar))

    (setv open-file (QAction (QIcon "../src/open24.png") "Open" self))
    ((. open-file setShortcut) "Ctrl+O")
    ((. open-file setStatusTip) "Open new File")
    ((. open-file triggered connect) (. self show-dialog))

    (setv menubar ((. self menuBar)))
    (setv file-menu ((. menubar addMenu) "&File"))
    ((. file-menu addAction) open-file)

    ((. self setGeometry) 300 300 350 300)
    ((. self setWindowTitle) "File dialog")
    None)

  (defn show-dialog [self]
    (setv fname ((. QFileDialog getOpenFileName) self "Open file" "/home"))

    (when (first fname)
          (with [f (open (first fname) "r" :encoding "utf-8")]
                (setv data ((. f read)))
                ((. self text-edit setText) data)))
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
