#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QMainWindow qApp QMenu QApplication]])


(defclass Example [QMainWindow]
  (defn --init-- [self]
    ((. (super) --init--))
    ((. self setGeometry) 300 300 300 200)
    ((. self setWindowTitle) "Context menu")
    None)

  (defn contextMenuEvent [self event]
    (setv menu (QMenu self))
    (setv new-act ((. menu addAction) "New"))
    (setv opn-act ((. menu addAction) "Open"))
    (setv quit-act ((. menu addAction) "Quit"))
    (setv action ((. menu exec_) ((. self mapToGlobal) ((. event pos)))))

    (when (= action quit-act)
          ((. qApp quit)))
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
