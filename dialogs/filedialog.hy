#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QMainWindow QTextEdit QAction QFileDialog
                          QApplication]])
(import [PyQt5.QtGui [QIcon]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv self.text-edit (QTextEdit))
    ((. self setCentralWidget) (. self text-edit))
    (.statusBar self)

    (setv open-file (QAction (QIcon "../src/open24.png") "Open" self))
    ((. open-file setShortcut) "Ctrl+O")
    ((. open-file setStatusTip) "Open new File")
    ((. open-file triggered connect) (. self show-dialog))

    (setv menubar (.menuBar self))
    (setv file-menu ((. menubar addMenu) "&File"))
    ((. file-menu addAction) open-file)

    ((. self setGeometry) 300 300 350 300)
    ((. self setWindowTitle) "File dialog")
    (.show self))

  (defn show-dialog [self]
    (setv fname ((. QFileDialog getOpenFileName) self "Open file" "/home"))

    (if (first fname)
      (do
        (with [f (open (first fname) "r" :encoding "utf-8")]
          (setv data (.read f))
          ((. self text-edit setText) data))))))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
