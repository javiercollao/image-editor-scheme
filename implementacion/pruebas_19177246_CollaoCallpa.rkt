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

;; Creando 2 imagenes de 2x2 

(define img1 (image 2 2 (pixrgb-d 0 0 10 10 10 10)(pixrgb-d 0 1 20 20 20 20)(pixrgb-d 1 0 30 30 30 30) (pixrgb-d 1 1 40 40 40 40)))

(define img2 (image 2 2 (pixbit-d 0 0 1 10)(pixbit-d 0 1 0 20)(pixbit-d 1 0 0 30)(pixbit-d 1 1 1 4)))

(define img3 (image 2 2 (pixbit-d 0 0 1 10)(pixbit-d 0 1 0 20)(pixbit-d 0 2 0 30) (pixbit-d 1 0 1 4) (pixbit-d 1 1 0 3) (pixbit-d 1 2 1 4) (pixbit-d 2 0 1 4) (pixbit-d 2 1 0 5) (pixbit-d 2 2 0 4)))

(define img4 (image 4 4 (pixrgb-d 0 0 10 10 10 10)(pixrgb-d 0 1 20 20 20 20) (pixrgb-d 0 2 10 10 10 10) (pixrgb-d 0 3 10 10 10 10) (pixrgb-d 1 0 30 30 30 30)  (pixrgb-d 1 1 40 40 40 40) (pixrgb-d 1 2 30 30 30 30) (pixrgb-d 1 3 30 30 30 30) (pixrgb-d 2 0 30 30 30 30)  (pixrgb-d 2 1 30 30 30 30) (pixrgb-d 2 2 30 30 30 30) (pixrgb-d 2 3 30 30 30 30) (pixrgb-d 3 0 30 30 30 30) (pixrgb-d 3 1 30 30 30 30) (pixrgb-d 3 2 30 30 30 30) (pixrgb-d 3 3 30 30 30 30)))

(define img5 (imgRGB->imgHex img4))
;; FlipH

;(flipH img2)

