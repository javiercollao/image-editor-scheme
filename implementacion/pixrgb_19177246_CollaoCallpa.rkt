#lang racket
(require "./utils_19177246_CollaoCallpa.rkt")
(require "./pixbit_19177246_CollaoCallpa.rkt")
(provide (all-defined-out))

;; ======================================================
;; TDA pixrgb-d
;;
;; @author         :   Javier Collao
;; @representation :   Este TDA representa a la lista pixrgb-d, contiene todas las 
;; características para ... con C cubriendo valores entre 0 y 255
;;
;; pixrgb-d = x (int) X y (int) X r (C) X g (C) X b(C) X d (int)
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

;; ======================================================
;; Capa Selector

;; Descripción: Retorna el elemento R (red) de la lista
;; Dom: pixrgb-d (list)
;; Rec: r (int) 
;; Tipo de recursión: NA

(define getR (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove L)))
))

;; Descripción: Retorna el elemento G (green) de la lista
;; Dom: pixrgb-d (list)
;; Rec: g (int) 
;; Tipo de recursión: NA

(define getG (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove (firstElementRemove L))))
))

;; Descripción: Retorna el elemento B (blue) de la lista
;; Dom: pixrgb-d (list)
;; Rec: b (int) 
;; Tipo de recursión: NA

(define getB (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove (firstElementRemove (firstElementRemove L)))))
))

;; Descripción: Retorna el elemento depth de la lista
;; Dom: pixrgb-d (list)
;; Rec: depth (int) 
;; Tipo de recursión: NA

(define getDepth-rgb (lambda (L)
    (firstElement (firstElementRemove (firstElementRemove (firstElementRemove (firstElementRemove (firstElementRemove L))))))
))

;; ======================================================
;; Capa Pertenencia

;; Descripción: Verifica si la lista pixrgb-d es valida
;; Dom: pixrgb-d (list)
;; Rec: true or false (bool)
;; Tipo de recursión: NA 

(define pixrgb-d? (lambda (L)
    (if (= 6 (length L))
        (pixrgb-d?Aux (getPosX L) (getPosY L) (getR L) (getG L) (getB L) (getDepth-rgb L))
        #f
    )
))

(define pixrgb-d?Aux (lambda (posX posY r g b depth)
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (>= r 0) (<= r 255) (>= g 0) (<= g 255) (>= b 0) (<= b 255) )
        #t
        #f
    )
))

;; ======================================================
;; Otras funciones

;; incCh
;; Descripción: es una función que incrementa el valor del canal R en una unidad.
;; Dom: n (int)
;; Rec: n (int) 

(define incCh (lambda (n)
    (if (= n 255)
        0
        (+ n 1)
    )
))
 
;; setR
;; Descripción: modificador del canal R en un pixrgb-d
;; Dom: elementR (int), pixrgb-d (list)
;; Rec: pixrgb-d (list)

(define setR (lambda (elementR L)
    (pixrgb-d (getPosX L) (getPosY L) elementR (getG L) (getB L) (getDepth L))
))


;; pixrgb->string
;; Descripción: transforma en string un pixrgb-d
;; Dom: pixrgb-d (list)
;; Rec: string

(define pixrgb->string (lambda (L)
    (string-append "(" (toStringElement (getR L)) "," (toStringElement (getG L)) "," (toStringElement (getB L)) ")" )
))
