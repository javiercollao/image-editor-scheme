#lang racket
(require "./utils.rkt")  
(require "./image.rkt")
(require "./pixbit.rkt") 
(require "./pixhex.rkt") 
(require "./pixrgb.rkt")


;; ==========================

;; Colores de ejemplo RGB
(define negro-rgb (pixrgb-d 1 2 0 0 0 1))
(define blanco-rgb (pixrgb-d 1 2 255 255 255 1))
(define rojo-rgb (pixrgb-d 1 2 255 0 0 1))
(define verde-rgb (pixrgb-d 1 2 0 255 0 1))
(define azul-rgb (pixrgb-d 1 2 0 0 255 1))
(define naranjo-rgb (pixrgb-d 1 2 255 128 0 1))
(define amarillo-rgb (pixrgb-d 1 2 255 255 0 1))
(define otro-rgb (pixrgb-d 1 2 128 128 128 1))
