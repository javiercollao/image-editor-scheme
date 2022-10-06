#lang racket
(require "./utils_19177246_CollaoCallpa.rkt") 
(require "./pixbit_19177246_CollaoCallpa.rkt")
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

;; ======================================================
;; Capa Selector

;; Descripción: Retorna el elemento hex de la lista
;; Dom: pixhex-d (list)
;; Rec: hex (string) 
;; Tipo de recursión: NA

(define getHex (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove L)))
))
 
;; ======================================================
;; Capa Pertenencia

;; Descripción: Verifica si la lista pixhex-d es valida
;; Dom: pixhex-d (list)
;; Rec: true or false (bool)
;; Tipo de recursión: NA 

(define pixhex-d? (lambda (L)
    (if (string? (getHex L))
        (pixhex-d?Aux (getPosX L) (getPosY L) (getHex L) (getDepth L))
        #f
    )
))

(define pixhex-d?Aux (lambda (posX posY hex depth)
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (string? hex) (= 6 (strLength hex)))
        #t
        #f
    )
))

;; ======================================================
;; Otras funciones

;; pixhex->string
;; Descripción: transforma en string un pixhex-d
;; Dom: pixhex-d (list)
;; Rec: string

(define pixhex->string (lambda (L)
    (string-append "#" (getBit L))
))



