#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QPushButton QFrame QColorDialog
                          QApplication]])
(import [PyQt5.QtGui [QColor]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (setv col (QColor 0 0 0 ))

    (setv self.btn (QPushButton "Dialog" self))
    ((. self btn move) 20 20)

    ((. self btn clicked connect) (. self show-dialog))

    (setv self.frm (QFrame self))
    ((. self frm setStyleSheet)
      (% "QWidget { background-color: %s }" (.name col)))
    ((. self frm setGeometry) 130 22 100 100)

    (.setGeometry self 300 300 250 180)
    (.setWindowTitle self "Color dialog")
    (.show self))

  (defn show-dialog [self]
    ; Cancelボタンを押すと、
    ; col.isValid()がFalseを返す値がcolに代入される
    (setv col (.getColor QColorDialog))

    ; OKボタンを押したら、
    ; 呼び出し元のウインドウにあるフレームウィジェットを
    ; 選択した色で塗りつぶす
    (if (.isValid col)
      ((. self frm setStyleSheet)
        (% "QWidget { background-color: %s }" (.name col))))))


(defn main []
  (setv app (QApplication (. sys argv)))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
