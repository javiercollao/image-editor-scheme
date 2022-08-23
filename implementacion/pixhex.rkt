#lang racket
;(require math)
(require "./utils.rkt") 
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
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (string? hex) (= 6 (strLength hex))
        (list posX posY hex depth)
        null
    )
))





