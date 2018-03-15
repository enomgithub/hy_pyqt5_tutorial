#!/usr/bin/env hy
;; -*- coding: utf-8 -*-
(import [PyQt5.QtWidgets [QWidget QDesktopWidget QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    ((. (super) --init--))
    ((. self resize) 250 150)

    ;; ディスプレイの中央に配置
    ((.  self center))

    ((. self setWindowTitle) "Center")
    None)

  (defn center [self]
    ;; ウインドウフレームのサイズなどを持つオブジェクトを取得
    (setv qr ((. self frameGeometry)))

    ;; ディスプレイ中央の座標を取得
    (setv cp ((. ((. (QDesktopWidget) availableGeometry)) center)))

    ;; オブジェクトの中心座標をディスプレイ中央に設定
    ((. qr moveCenter) cp)

    ;; オブジェクトの左上座標を
    ;; 実際のウインドウの左上座標に設定
    ((. self move) ((. qr topLeft)))
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
