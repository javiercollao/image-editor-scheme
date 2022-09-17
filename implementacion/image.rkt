#lang racket 
(require "./utils.rkt")
(require "./pixbit.rkt")
(require "./pixrgb.rkt")
(require "./pixhex.rkt")
(provide (all-defined-out))

;; ======================================================
;; TDA image
;;
;; @author         :   Javier Collao
;; @representation :   Este TDA representa a la lista image, contiene todas las 
;; características para las creación  de una imagen. 
;;
;; image = Width (int) X Height (int) X [pixbit-d* | pixrgb-d* | pixhex-d*]
;;

;; ======================================================
;; Capa Constructor
 
;; Descripción: Constructor de un tipo de dato image
;; Dom: Width (int) , Height (int) , [pixbit-d* | pixrgb-d* | pixhex-d*]
;; Rec: image (list)
;; Tipo de recursión: NA

;;(define image2 list)

(define imageList list)

(define image (lambda (W H . listsPix)
    (if (and (< 0 W) (< 0 H) (= (* W H) (length listsPix)))
        (imageList W H listsPix)
        null
    )
))

;; ======================================================
;; Capa Pertenencia

;; bitmap? 
;; Descripción: función que permite determinar si la imagen corresponde a un bitmap-d.
;; Dom: image (list)
;; Rec: boolean
;; Tipo de recursión: Cola

(define bitmap? (lambda (imageList)
    (if (= 0 (length (bitmap?Aux1 imageList)))
        #t
        #f
    )
))

(define bitmap?Aux1 (lambda (L)
    (myFilter isFalse? (bitmap?Aux2 L))
))

(define bitmap?Aux2 (lambda (L)
    (myMap operationBitmap? (elementsPix L))
))

(define operationBitmap? (lambda (e)
    (pixbit-d? e)
))
 
;; pixmap? 
;; Descripción: función que permite determinar si la imagen corresponde a un pixrgb-d.
;; Dom: 
;; Rec: 
;; Tipo de recursión: Cola

(define pixmap? (lambda (imageList)
    (if (= 0 (length (pixmap?Aux1 imageList)))
        #t
        #f
    )
))

(define pixmap?Aux1 (lambda (L)
    (myFilter isFalse? (pixmap?Aux2 L))
))

(define pixmap?Aux2 (lambda (L)
    (myMap operationPixmap? (elementsPix L))
))

(define operationPixmap? (lambda (e)
    (pixrgb-d? e)
))
 
;; hexmap?
;; Descripción: función que permite determinar si la imagen corresponde a un hexmap-d.
;; Dom: 
;; Rec:
;; Tipo de recursión: Cola

(define hexmap? (lambda (imageList)
    (if (= 0 (length (hexmap?Aux1 imageList)))
        #t
        #f
    )
))

(define hexmap?Aux1 (lambda (L)
    (myFilter isFalse? (hexmap?Aux2 L))
))

(define hexmap?Aux2 (lambda (L)
    (myMap operationHexmap? (elementsPix L))
))

(define operationHexmap? (lambda (e)
    (pixhex-d? e)
))


;; compressed?
;; Descripción: función que determina si una imagen está comprimida.
;; Dom: 
;; Rec:
;; Tipo de recursión:



;; ======================================================
;; Capa Selector

;; Descripción: Retorna el elemento Width de una imagen. 
;; Dom: image (list)
;; Rec: width (int)
;; Tipo de recursión: NA

(define getWidth (lambda (imageList)
    (firstElement imageList)
))

;; Descripción: Retorna el elemento Width de una imagen considerando que la posicion 0. 
(define width (lambda (img)
    (- (getWidth img) 1)
))

;; Descripción: Retorna el elemento Height de una imagen. 
;; Dom: image (list)
;; Rec: height (int)
;; Tipo de recursión: NA

(define getHeight (lambda (imageList)
    (firstElement (firstElementRemove imageList))
))

;; Descripción: Retorna el elemento Height de una imagen considerando que la posicion 0. 
(define height (lambda (img)
    (- (getHeight img) 1)
))

;; Descripción: Retorna la lista de elementos [pixbit-d* | pixrgb-d* | pixhex-d*]
;; Dom: image (list)
;; Rec: [pixbit-d* | pixrgb-d* | pixhex-d*] (list)
;; Tipo de recursión: NA

(define elementsPix (lambda (imageList)
    (firstElement (firstElementRemove (firstElementRemove imageList)))
))

;; ======================================================
;; Otras funciones

;; flipH
;; Descripción: función que permite invertir una imágen horizontalmente.
;; Dom: image (list)
;; Rec: image (list)
;; Tipo de recursión: Natural

(define flipH (lambda (IMG)
    (imageList (getWidth IMG) (getHeight IMG) (flipHAux (width IMG) 0 (elementsPix IMG)))
))
 
(define flipHAux (lambda (i n L)
   (if (= i 0)
    (append (myMap2 newPosX n (myFilter2 posXVerification i  L)))
    (append (myMap2 newPosX n (myFilter2 posXVerification i  L)) (flipHAux (- i 1) (+ n 1) L))
   )
))

;; Descripción: condición que verifica el valor de la coordenada X 
(define posXVerification (lambda (L i)
    (if (= i (getPosX L))
        #t
        #f
    )
))

;; Descripción: operación que modifica la coordenada X  
(define newPosX (lambda (L n)
    (if (pixbit-d? L)
        (pixbit-d n (getPosY L) (getBit L) (getDepth L))
        (if (pixrgb-d? L)
            (pixrgb-d n (getPosY L) (getR L) (getG L) (getB L) (getDepth L))
            (if (pixhex-d? L)
                (pixhex-d n (getPosY L) (getHex L) (getDepth L))
                null
            )
        )
    )
))

;; flipV
;; Descripción: función que permite invertir una imágen verticalmente.
;; Dom: image (list)
;; Rec: image (list)
;; Tipo de recursión: Natural

(define flipV (lambda (IMG)
    (imageList (getWidth IMG) (getHeight IMG) (flipVAux (height IMG) 0 (elementsPix IMG)))
))
 
(define flipVAux (lambda (i n L)
   (if (= i 0)
    (append (myMap2 newPosY n (myFilter2 posYVerification i  L)))
    (append (myMap2 newPosY n (myFilter2 posYVerification i  L)) (flipVAux (- i 1) (+ n 1) L))
   )
))

;; Descripción: condición que verifica el valor de la coordenada Y
(define posYVerification (lambda (L i)
    (if (= i (getPosY L))
        #t
        #f
    )
))

;; Descripción: operación que modifica la coordenada Y 
(define newPosY (lambda (L n)
    (if (pixbit-d? L)
        (pixbit-d (getPosX L) n (getBit L) (getDepth L))
        (if (pixrgb-d? L)
            (pixrgb-d (getPosX L) n (getR L) (getG L) (getB L) (getDepth L))
            (if (pixhex-d? L)
                (pixhex-d (getPosX L) n (getHex L) (getDepth L))
                null
            )
        )
    )
))

;; crop
;; Descripción: Recortar una imágen a partir de un cuadrante.
;; Dom: 
;; Rec:
;; Tipo de recursión: Natural

;; arreglar width y height 
(define crop (lambda (IMG x1 y1 x2 y2)
    (if (and (= y1 y2) (<= x1 x2))
        (imageList (- (getWidth IMG) x1) (- (getHeight IMG) y1) (cropAux (elementsPix IMG) x1 x2 y2))
        null
    )
))

(define cropAux (lambda (L x1 x2 y2)
    (if (= x1 x2)
        (append (myFilter3 findPix x2 y2 L) null )
        (append (myFilter3 findPix x2 y2 L) (cropAux L x1 (- x2 1) y2) )
    )
))

(define findPix (lambda (L x y)
    (if (and (= x (getPosX L)) (<= (getPosY L) y) (>= (getPosY L) 0))
        #t
        #f
    )
))


;; imgRGB->imgHex
;; Descripción: Transforma una imagen desde una representación RGB a una representación HEX.
;; Dom: 
;; Rec:
;; Tipo de recursión:



;; histogram
;; Descripción: Retorna un histograma de frecuencias a partir de los colores en cada una de las imágenes. Debe funcionar para bitmap-d, pixmap-d y hexmap-d.
;; Dom: 
;; Rec:
;; Tipo de recursión:



;; rotate90
;; Descripción: rota la imágen 90° a la derecha.
;; Dom: 
;; Rec:
;; Tipo de recursión:

;(define rotate90 (lambda (IMG)
;    (imageList (getWidth IMG) (getHeight IMG) (flipVAux (height IMG) 0 (elementsPix IMG)))
;))

;; compress
;; Descripción: Comprime una imágen eliminando aquellos pixeles con el color más frecuente. La imagen comprimida resultante solo se puede manipular con las otras funciones una vez que haya sido descomprimida a partir de la función señalada más adelante.
;; Dom: 
;; Rec:
;; Tipo de recursión:



;; edit
;; Descripción: Permite aplicar funciones especiales a las imágenes. Por ejemplo, para modificar colores en alguno de los canales, pasar a blanco y negro, etc.
;; Dom: 
;; Rec:
;; Tipo de recursión:



;; invertColorBit
;; Descripción: Función que permite obtener el valor del bit opuesto.
;; Dom: 
;; Rec:
;; Tipo de recursión:


;; invertColorRGB
;; Descripción: Función que permite obtener el color simétricamente opuesto en cada canal dentro de un pixel.
;; Dom: 
;; Rec:
;; Tipo de recursión:



;; adjustChannel
;; Descripción: Función que permite ajustar cualquier canal de una imagen con pixeles pixrgb-d, incluido el canal de profundidad d. Se asume que la función que modificará el canal produce valores dentro del rango válido.
;; Dom: 
;; Rec:
;; Tipo de recursión:



;; image->string
;; Descripción: Función que transforma una imagen a una representación string. La transformación depende de si la imagen es bitmap-d, hexmap-d o pixmap-d, para lo cual se pasa la función de transformación correspondiente.
;; Dom: 
;; Rec:
;; Tipo de recursión:




;; depthLayers
;; Descripción: Función que permite separar una imágen en capas en base a la profundidad en que se sitúan los pixeles. El resultado consiste en una lista de imágenes donde cada una agrupa los píxeles que se sitúan en el mismo nivel de profundidad. Además, en las imágenes resultantes se sustituyen los píxeles que se encuentran en otro nivel de profundidad por píxeles blancos (255,255,255).
;; Dom: 
;; Rec:
;; Tipo de recursión:



;; decompress
;; Descripción: Función que permite descomprimir una imágen comprimida. Para esto se toma como referencia el color más frecuente a fin de reconstruir todos los píxeles que fueron eliminados en la compresión.
;; Dom: 
;; Rec:
;; Tipo de recursión:  



