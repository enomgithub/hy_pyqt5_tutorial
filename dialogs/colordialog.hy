#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QPushButton QFrame QColorDialog
                          QApplication]])
(import [PyQt5.QtGui [QColor]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    (setv col (QColor 0 0 0 ))

    (setv (. self btn) (QPushButton "Dialog" self))
    ((. self btn move) 20 20)

    ((. self btn clicked connect) (. self show-dialog))

    (setv (. self frm) (QFrame self))
    ((. self frm setStyleSheet) (% "QWidget { background-color: %s }"
                                   (.name col)))
    ((. self frm setGeometry) 130 22 100 100)

    ((. self setGeometry) 300 300 250 180)
    ((. self setWindowTitle) "Color dialog")
    None)

  (defn show-dialog [self]
    ;; Cancelボタンを押すと、
    ;; col.isValid()がFalseを返す値がcolに代入される
    (setv col ((. QColorDialog getColor)))

    ;; OKボタンを押したら、
    ;; 呼び出し元のウインドウにあるフレームウィジェットを
    ;; 選択した色で塗りつぶす
    (if ((. col isValid))
        ((. self frm setStyleSheet) (% "QWidget { background-color: %s }"
                                       ((. col name)))))
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
