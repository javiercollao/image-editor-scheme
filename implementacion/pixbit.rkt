#lang racket 
(require "./utils.rkt")  
(provide (all-defined-out))

;; ======================================================
;; TDA pixbit-d
;;
;; @author         :   Javier Collao
;; @representation :   Este TDA representa a la lista pixbit-d, contiene todas las 
;; características para ... 
;;
;; pixbit-d = x (int) X y (int) X bit ([0|1]) X depth (int)
;;

;; ======================================================
;; Capa Constructor

;; Descripción: Constructor de un tipo de dato pixbit-d
;; Dom: x (int) , y (int) , bit ([0|1]) (int) , depth (int)
;; Rec: pixbit-d (list)
;; Tipo de recursión: NA

(define pixbit-d (lambda (posX posY bit depth)
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (or (= bit 0) (= bit 1)) )
        (list posX posY bit depth)
        null
    )
))

;; (pixbit-d 0 0 1 4) #t
;; (pixbit-d 0 2 2 2) #f

;; ======================================================
;; Capa Selector

;; Descripción: Retorna el elemento PosX de la lista
;; Dom: pixbit-d (list) | pixrgb-d (list) | pixhex-d (list)
;; Rec: posX (int) 
;; Tipo de recursión: NA

(define getPosX (lambda (L)
    (firstElement L)
))

;; Descripción: Retorna el elemento PosY de la lista
;; Dom: pixbit-d (list) | pixrgb-d (list) | pixhex-d (list)
;; Rec: posY (int) 
;; Tipo de recursión: NA

(define getPosY (lambda (L)
    (firstElement (firstElementRemove L))
))

;; Descripción: Retorna el elemento bit de la lista
;; Dom: pixbit-d (list)
;; Rec: bit ([0|1]) (int)
;; Tipo de recursión: NA

(define getBit (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove L)))
))

;; Descripción: Retorna el elemento depth de la lista
;; Dom: pixbit-d (list) | pixhex-d (list)
;; Rec: depth (int) 
;; Tipo de recursión: NA

(define getDepth (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove (firstElementRemove L))))
))

;; ======================================================
;; Capa Pertenencia

;; Descripción: Verifica si la lista pixbit-d es valida
;; Dom: pixbit-d (list)
;; Rec: true or false (bool)
;; Tipo de recursión: NA 

(define pixbit-d? (lambda (L)
    (if (integer? (getBit L))
        (pixbit-d?Aux (getPosX L) (getPosY L) (getBit L) (getDepth L))
        #f
    )
))

(define pixbit-d?Aux (lambda (posX posY bit depth)
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (or (= bit 0) (= bit 1)) )
        #t
        #f
    )
))

;; ======================================================
;; Otras funciones

;(define pixbit->string (lambda (L)
;))
