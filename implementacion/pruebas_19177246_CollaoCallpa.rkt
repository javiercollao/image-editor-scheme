#lang racket
(require "./utils.rkt")  
(require "./image.rkt")
(require "./pixbit.rkt") 
(require "./pixhex.rkt") 
(require "./pixrgb.rkt")


;; ==========================

;; Colores RGB
(define negro-rgb (pixrgb-d 1 2 0 0 0 1))
(define blanco-rgb (pixrgb-d 1 2 255 255 255 1))
(define rojo-rgb (pixrgb-d 1 2 255 0 0 1))
(define verde-rgb (pixrgb-d 1 2 0 255 0 1))
(define azul-rgb (pixrgb-d 1 2 0 0 255 1))
(define naranjo-rgb (pixrgb-d 1 2 255 128 0 1))
(define amarillo-rgb (pixrgb-d 1 2 255 255 0 1))
(define otro-rgb (pixrgb-d 1 2 128 128 128 1))

;; Colores HEX
(define negro-hex (pixhex-d 1 2 "000000" 1))
(define blanco-hex (pixhex-d 1 2 "FFFFFF" 1))
(define rojo-hex (pixhex-d 1 2 "FF0000" 1))
(define verde-hex (pixhex-d 1 2 "00FF00" 1))
(define azul-hex (pixhex-d 1 2 "0000FF" 1))
(define naranjo-hex (pixhex-d 1 2 "FF8000" 1))
(define amarillo-hex (pixhex-d 1 2 "FFFF00" 1))
(define otro-hex (pixhex-d 1 2 "808080" 1))

;; Colores de Bit
(define negro-bit (pixbit-d 0 0 1 4))
(define blanco-bit (pixbit-d 0 0 0 4))

;; ==========================




