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

(define image list)

;; (image 2 2 (pixbit-d 0 0 1 4) (pixbit-d 0 1 0 4) (pixbit-d 1 0 0 4) (pixbit-d 1 1 0 4))
;; (image 2 2 )   
;; ======================================================
;; Capa Pertenencia

;; bitmap? 
;; Descripción: función que permite determinar si la imagen corresponde a un bitmap-d.
;; Dom: 
;; Rec:
;; Tipo de recursión:

(define bitmap? (lambda (imageList)
    (myMap operationBitmap? (firstElementRemove (firstElementRemove imageList)))
))

(define operationBitmap? (lambda (e)
    (pixbit-d? e)
))

;; << necesitamos un filter para verificar si existe algun false >>, 
;; ademas , es necesario que coincida con la cantidad de widht y heignt entregados?
;; que sucede si se repite la misma posicion  para cada pixbit-d* | pixrgb-d* | pixhex-d* segun sea el caso


;; pixmap? 
;; Descripción: función que permite determinar si la imagen corresponde a un pixmap-d.
;; Dom: 
;; Rec: 
;; Tipo de recursión: 

(define pixmap? (lambda (imageList)
    (myMap operationPixmap? (firstElementRemove (firstElementRemove imageList)))
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
    (myMap operationHexmap? (firstElementRemove (firstElementRemove imageList)))
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

;; ======================================================
;; Otras funciones

;; flipH
;; Descripción: función que permite invertir una imágen horizontalmente.
;; Dom: 
;; Rec:
;; Tipo de recursión: 


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



