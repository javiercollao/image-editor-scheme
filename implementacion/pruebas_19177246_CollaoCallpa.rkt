#lang racket
(require "./utils.rkt")  
(require "./image.rkt")
(require "./pixbit.rkt") 
(require "./pixhex.rkt") 
(require "./pixrgb.rkt")

;; Script de Pruebas

;; ==========================
;;          image 
;; ==========================

(define img0 (image 9 7 (pixbit-d 0 0 1 7)(pixbit-d 1 0 0 4)(pixbit-d 2 0 0 4)(pixbit-d 3 0 0 4)(pixbit-d 4 0 1 7)(pixbit-d 5 0 0 4)(pixbit-d 6 0 0 4)(pixbit-d 7 0 0 4)(pixbit-d 8 0 0 4)(pixbit-d 0 1 1 7)(pixbit-d 1 1 0 4)(pixbit-d 2 1 1 7)(pixbit-d 3 1 0 4)(pixbit-d 4 1 1 7)(pixbit-d 5 1 0 4)(pixbit-d 6 1 0 4)(pixbit-d 7 0 0 4)(pixbit-d 8 1 0 4)(pixbit-d 0 2 1 7)(pixbit-d 1 2 1 7)(pixbit-d 2 2 1 7)(pixbit-d 3 2 1 7)(pixbit-d 4 2 1 7)(pixbit-d 5 2 0 4)(pixbit-d 6 2 0 4)(pixbit-d 7 0 0 4)(pixbit-d 8 2 0 4)(pixbit-d 0 3 0 4)(pixbit-d 1 3 1 7)(pixbit-d 2 3 1 7)(pixbit-d 3 3 1 7)(pixbit-d 4 3 0 4)(pixbit-d 5 3 0 4)(pixbit-d 6 3 1 7)(pixbit-d 7 0 1 7)(pixbit-d 8 3 0 4)(pixbit-d 0 4 0 4)(pixbit-d 1 4 1 7)(pixbit-d 2 4 1 7)(pixbit-d 3 4 1 7)(pixbit-d 4 4 1 7)(pixbit-d 5 4 1 7)(pixbit-d 6 4 1 7)(pixbit-d 7 0 0 4)(pixbit-d 8 4 1 7)(pixbit-d 0 5 0 4)(pixbit-d 1 5 1 7)(pixbit-d 2 5 1 7)(pixbit-d 3 5 1 7)(pixbit-d 4 5 1 7)(pixbit-d 5 5 0 4)(pixbit-d 6 5 0 4)(pixbit-d 7 0 0 4)(pixbit-d 8 5 1 7)(pixbit-d 0 6 0 4)(pixbit-d 1 6 0 4)(pixbit-d 2 6 0 4)(pixbit-d 3 6 0 4)(pixbit-d 4 6 0 4)(pixbit-d 5 6 0 4)(pixbit-d 6 6 0 4)(pixbit-d 7 0 0 4)(pixbit-d 8 6 0 4)))

(define img2 (image 2 2 (pixbit-d 0 0 1 10)(pixbit-d 0 1 0 20)(pixbit-d 1 0 0 30)(pixbit-d 1 1 1 4)))

(define img3 (image 3 3 (pixbit-d 0 0 1 10)(pixbit-d 0 1 0 20)(pixbit-d 0 2 0 30) (pixbit-d 1 0 1 4) (pixbit-d 1 1 0 3) (pixbit-d 1 2 1 4) (pixbit-d 2 0 1 4) (pixbit-d 2 1 0 5) (pixbit-d 2 2 0 4)))

(define img1 (image 2 2 (pixrgb-d 0 0 10 10 10 10)(pixrgb-d 0 1 20 20 20 20)(pixrgb-d 1 0 30 30 30 30) (pixrgb-d 1 1 40 40 40 40)))

(define img4 (image 4 4 (pixrgb-d 0 0 10 10 10 12)(pixrgb-d 0 1 20 20 20 2) (pixrgb-d 0 2 10 10 10 60) (pixrgb-d 0 3 10 10 10 40) (pixrgb-d 1 0 30 30 30 30)  (pixrgb-d 1 1 40 40 40 20) (pixrgb-d 1 2 30 30 30 23) (pixrgb-d 1 3 30 30 30 11) (pixrgb-d 2 0 30 30 30 12)  (pixrgb-d 2 1 30 30 30 21) (pixrgb-d 2 2 30 30 30 3) (pixrgb-d 2 3 30 30 30 44) (pixrgb-d 3 0 30 30 30 67) (pixrgb-d 3 1 30 30 30 31) (pixrgb-d 3 2 30 30 30 30) (pixrgb-d 3 3 30 30 30 30)))

(define img5 (image 4 3 (pixrgb-d 0 0 11 2 0 12) (pixrgb-d 0 1 210 130 140 32) (pixrgb-d 0 2 215 213 110 13) (pixrgb-d 0 3 10 10 10 1) (pixrgb-d 1 0 233 222 0 2) (pixrgb-d 1 1 21 10 140 13) (pixrgb-d 1 2 225 243 10 2) (pixrgb-d 1 3 3 140 130 13)(pixrgb-d 2 0 1 22 20 13) (pixrgb-d 0 1 20 130 40 42) (pixrgb-d 0 2 215 23 10 14) (pixrgb-d 0 3 101 240 250 1)))

(define img6 (image 3 3 (pixhex-d 0 0 "0A0A0A" 13)(pixhex-d 0 1 "141414" 24)(pixhex-d 0 2 "0A0A0A" 1)(pixhex-d 1 0 "1E1E1E" 330)(pixhex-d 1 1 "282828" 20)(pixhex-d 1 2 "1E1E1E" 35)(pixhex-d 2 0 "1E1E1E" 3)(pixhex-d 2 1 "1E1E1E" 6)(pixhex-d 2 2 "1E1E1E" 66)))

;; ==========================
;;      imgRGB->imgHex 
;; ==========================

(define img7 (imgRGB->imgHex img4))

(define img8 (imgRGB->imgHex img1))

(define img9 (imgRGB->imgHex img5))


;; ==========================
;;         histogram 
;; ==========================

;(histogram img0)
;(histogram img4)
;(histogram img9)

;; ==========================
;;          compress  
;; ==========================

;(compress img0)
;(compress img4)
;(compress img9)

;; ==========================
;;        compressed? 
;; ==========================

;(compressed? (compress img0))
;(compressed? (compress img9))
;(compressed? img1)

;; ==========================
;;         decompress   
;; ==========================

;(decompress (compress img1))
;(decompress (compress img4))
;(decompress (compress img5))
;(decompress (compress img7))

;; ==========================
;;      depthLayers    
;; ==========================

;(depthLayers img7)
;(depthLayers img1)
;(depthLayers img9)
;(depthLayers img3)

;; ==========================
;;          bitmap? 
;; ==========================

;(bitmap? img0)
;(bitmap? img3)
;(bitmap? img5)

;; ==========================
;;          pixmap? 
;; ==========================

;(pixmap? img1)
;(pixmap? img4)
;(pixmap? img7)

;; ==========================
;;          hexmap? 
;; ==========================

;(hexmap? img8)
;(hexmap? img9)
;(hexmap? img0)

;; ==========================
;;          flipH    
;; ==========================

;(flipH img0)
;(flipH img4)
;(flipH img8)


;; ==========================
;;          flipV      
;; ==========================

;(flipV img1)
;(flipV img4)
;(flipV img8)


;; ==========================
;;           crop          
;; ==========================



;; ==========================
;;          rotate90       
;; ==========================
;(rotate90 img0)
;(rotate90 img2)
;(rotate90 img4)
;(rotate90 img8)   
;(rotate90 img6)

;; ==========================
;;          edit           
;;      invertColorBit 
;;      invertColorRGB 
;; ==========================





;; ==========================
;;       adjustChannel  
;; ==========================



;; ==========================
;;       image->string  
;; ==========================

;(image->string img0 pixbit->string)
;(image->string img2 pixbit->string)
;(image->string img3 pixbit->string)

;(image->string img1 pixrgb->string)
;(image->string img4 pixrgb->string)
;(image->string img5 pixrgb->string)

;(image->string img7 pixhex->string)
;(image->string img8 pixhex->string)
;(image->string img9 pixhex->string)




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
