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

(define image (lambda (W H . listsPix)
    (if (and (< 0 W) (< 0 H) (= (* W H) (length listsPix)))
        (list W H listsPix)
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
;; Tipo de recursión: 

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
;; Tipo de recursión:

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

;; Descripción: Retorna el elemento Height de una imagen. 
;; Dom: image (list)
;; Rec: height (int)
;; Tipo de recursión: NA

(define getHeight (lambda (imageList)
    (firstElement (firstElementRemove imageList))
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
;; Dom: 
;; Rec:
;; Tipo de recursión: 

;(define row (lambda (L)
;    (rowAux (getWidth L) (elementsPix L))
;))
;
;(define column (lambda (Width L)
;    (if (= Width 0)
;        null
;        (cons (car L) (column (- Width 1) (cdr L)))    
;    )  
;))

;; ordenar 


;;(define )

;(define prueba (lambda (L)
;    (fila (getWidth L) (elementsPix L))
;))
;
;(define fila (lambda (Width L)
;    (if (= Width 0)
;        null
;        (reverse (cons (car L) (fila (- Width 1) (cdr L)))) 
;    )  
;))


;;=================================
;(define linealCards (lambda (img) 
;    (if (null? img)
;        null
;        (linealCardsJ (getHeight img) img)
;    )
;))
;
;(define linealCardsJ (lambda (j img)
;    (if (= j 0)
;        (append (linealElementsGenerator (cardsSize img) j img) null)
;        (append (linealElementsGenerator (cardsSize img) j img) (linealCardsJ (- j 1) img) )    
;    )  
;))
;
;(define linealElementsGenerator (lambda (k j img)
;        (if (= k 0)  
;            (addElementToCard (+ k 1) null)
;            (addElementToCard  (+ (* (cardsSize img) j) (+ k 1)) (linealElementsGenerator (- k 1) j img) )
;        )
;    )
;) 

; aqui lo que estamos creando es una lista de posiciones le damos numero de columnas Width y la fila y
; podriamos utilizar filter para traer una cierta cantidad de elementos con una caracteristica que tengan posX 0
;(define suma (lambda (columns y L)
;    (sumaAux 0 (- columns 1) y (elementsPix L))
;))
;
;(define sumaAux1 (lambda (i x y L)
;  
;))
;
;(define sumaAux (lambda (i x y L)
;   (if (= i x)
;    (cons (list y i (getBit (car L)) (getDepth (car L))) null)
;    (cons (list y i (getBit (car L)) (getDepth (car L))) (sumaAux (+ i 1) x y (cdr L)))
;   )
;))



(define invert (lambda (L i)
    (reverse (myFilter i invertFunc (elementsPix L)))
))
 
(define invertFunc (lambda (element)
    (if (= (car element) 1)
        #t
        #f
    )
))

 

 

;; flipV
;; Descripción: función que permite invertir una imágen verticalmente.
;; Dom: 
;; Rec:
;; Tipo de recursión:


;; crop
;; Descripción: Recortar una imágen a partir de un cuadrante.
;; Dom: 
;; Rec:
;; Tipo de recursión:




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



