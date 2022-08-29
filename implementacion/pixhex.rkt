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
    (if (null? L)
        #f
        (pixhex-d?Aux (getPosX L) (getPosY L) (getHex L) (getDepth L))
    )
))

(define pixhex-d?Aux (lambda (posX posY hex depth)
    (if (and (>= posX 0) (>= posY 0) (>= depth 0) (string? hex) (= 6 (strLength hex)))
        #t
        #f
    )
))

;; ======================================================
;; Colores de ejemplo HEX
;; (define negro-hex (pixhex-d 1 2 "000000" 1))
;; (define blanco-hex (pixhex-d 1 2 "FFFFFF" 1))
;; (define rojo-hex (pixhex-d 1 2 "FF0000" 1))
;; (define verde-hex (pixhex-d 1 2 "00FF00" 1))
;; (define azul-hex (pixhex-d 1 2 "0000FF" 1))
;; (define naranjo-hex (pixhex-d 1 2 "FF8000" 1))
;; (define amarillo-hex (pixhex-d 1 2 "FFFF00" 1))
;; (define otro-hex (pixhex-d 1 2 "808080" 1))


