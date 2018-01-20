#!/usr/bin/env hy
; -*- coding: utf-8 -*-
(import sys)

(import [PyQt5.QtWidgets [QWidget QDesktopWidget QApplication]])


(defclass Example [QWidget]
  (defn --init-- [self]
    (.--init-- (super))
    (.initUI self))

  (defn initUI [self]
    (.resize self 250 150)

    ; ディスプレイの中央に配置
    (.center self)

    (.setWindowTitle self "Center")
    (.show self))

  (defn center [self]
    ; ウインドウフレームのサイズなどを持つオブジェクトを取得
    (setv qr (.frameGeometry self))

    ; ディスプレイ中央の座標を取得
    (setv cp (-> (QDesktopWidget) (.availableGeometry) (.center)))

    ; オブジェクトの中心座標をディスプレイ中央に設定
    (.moveCenter qr cp)

    ; オブジェクトの左上座標を
    ; 実際のウインドウの左上座標に設定
    (.move self (.topLeft qr))))


(defn main []
  (setv app (QApplication sys.argv))
  (setv ex (Example))
  (.exec_ app)
  0)


(if (= --name-- "__main__")
  (.exit sys (main)))
