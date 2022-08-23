#lang racket
;(require math)
;(require "utils/lista_19177246_CollaoCallpa.rkt") 
(provide (all-defined-out))

;; ======================================================
;; TDA pixrgb-d
;;
;; @author         :   Javier Collao
;; @representation :   Este TDA representa a la lista pixrgb-d, contiene todas las 
;; características para ... con C cubriendo valores entre 0 y 255
;;
;; pixrgb-d =  x (int) X y (int) X r (C) X g (C) X b(C) X d (int)
;;

;; ======================================================
;; Capa Constructor

;; Descripción: Constructor de un tipo de dato pixrgb-d
;; Dom: x (int) , y (int) , r (C) , g (C) , b(C) , depth (int)
;; Rec: pixrgb-d (list)
;; Tipo de recursión: NA

(define pixrgb-d (lambda (posX posY r g b depth)
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (>= r 0) (<= r 255) (>= g 0) (<= g 255) (>= b 0) (<= b 255) )
        (list posX posY r g b depth)
        null
    )
))

