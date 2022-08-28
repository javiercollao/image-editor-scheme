#lang racket
(require "./utils.rkt") 
(require "./pixbit.rkt")
(provide (all-defined-out))

;; ======================================================
;; TDA pixhex-d
;;
;; @author         :   Javier Collao
;; @representation :   Este TDA representa a la lista pixhex-d, contiene todas las 
;; características para ... 
;;
;; pixhex-d = x (int) X y (int) X hex(String) X d (int)
;;

;; ======================================================
;; Capa Constructor

;; Descripción: Constructor de un tipo de dato pixrgb-d
;; Dom: x (int), y (int), hex(String), depth (int)
;; Rec: pixhex-d (list)
;; Tipo de recursión: NA

(define pixhex-d (lambda (posX posY hex depth)
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (string? hex) (= 6 (strLength hex)))
        (list posX posY hex depth)
        null
    )
))

;; (pixhex-d 2 3 "ffffff" 3) #t
;; (pixhex-d 1 3 423233 0) #f

;; ======================================================
;; Capa Selector

;; tercer elemento
;; Tipo de recursión: NA
(define getHex (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove L)))
))
 
;; ======================================================
;; Capa Pertenencia





