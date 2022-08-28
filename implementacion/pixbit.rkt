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
;; pixbit-d =  x (int) X y (int) X bit ([0|1]) X depth (int)
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

;; primer elemento
;; Tipo de recursión: NA
(define getPosX (lambda (L)
    (firstElement L)
))

;; segundo elemento
;; Tipo de recursión: NA
(define getPosY (lambda (L)
    (firstElement (firstElementRemove L))
))

;; tercer elemento
;; Tipo de recursión: NA
(define getBit (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove L)))
))

;; cuarto elemento 
;; Tipo de recursión: NA
(define getDepth (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove (firstElementRemove L))))
))

;; ======================================================
;; Capa Pertenencia

;; Tipo de recursión: NA
(define pixbit-d? (lambda (L)
    (if (null? L)
        #f
        (pixbit-d?Aux (getPosX L) (getPosY L) (getBit L) (getDepth L))
    )
))

(define pixbit-d?Aux (lambda (posX posY bit depth)
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (or (= bit 0) (= bit 1)) )
        #t
        #f
    )
))

