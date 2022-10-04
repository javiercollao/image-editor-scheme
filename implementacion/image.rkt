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

(define crop (lambda (IMG x1 y1 x2 y2)
    (if (and (= y1 y2) (<= x1 x2))
        (imageList (+ (- x2 x1) 1) (- (getHeight IMG) (- (height IMG) y2)) (resetPosition (cropAux (elementsPix IMG) x1 x2 y2) x1 x2))
        null
    )
))

(define cropAux (lambda (L x1 x2 y2)
    (if (= x1 x2)
        (append (myFilter3 findPix x2 y2 L) null )
        (append (myFilter3 findPix x2 y2 L) (cropAux L x1 (- x2 1) y2) )
    )
))

;; Descripción: Es la condicion para encontrar un pix element
(define findPix (lambda (L x y)
    (if (and (= x (getPosX L)) (<= (getPosY L) y) (>= (getPosY L) 0))
        #t
        #f
    )
))

;; Descripción: Se encarga de reestablecer las coordenadas desde la posicion inicial 0, 0. Solo cuando el valor de x1 es distinto de 0.
(define resetPosition (lambda (L x1 x2)
    (if (= x1 0)
        L
        (resetPositionAux L x1 x2 0)
    )
))

(define resetPositionAux (lambda (L x1 x2 n)
    (if (= x1 x2)
        (append (myMap2 newPosX n (myFilter2 posXVerification x1 L)) null)
        (append (myMap2 newPosX n (myFilter2 posXVerification x1 L)) (resetPositionAux L (+ x1 1) x2 (+ n 1)))
    )
))

;; imgRGB->imgHex
;; Descripción: Transforma una imagen desde una representación RGB a una representación HEX.
;; Dom: image (list)
;; Rec: image (list)
;; Tipo de recursión: NA

(define imgRGB->imgHex (lambda (IMG)
    (if (pixmap? IMG)
        (imageList (getWidth IMG) (getHeight IMG) (imgRGB->imgHexAux (elementsPix IMG)))
        null
    )
))

(define imgRGB->imgHexAux (lambda (L)
    (myMap newHex L)
))

(define newHex (lambda (L)
    (pixhex-d (getPosX L) (getPosY L) (converterRGBToHex (getR L) (getG L) (getB L)) (getDepth L)))
)

;; Descripción: Se encarga de convertir rgb a hexadecimal
(define converterRGBToHex (lambda (r g b)
    (string-append (toHex r) (toHex g) (toHex b))
))

(define toHex (lambda (color)
   (string-append (hexNumber (remainder (quotient color 16) 16)) (hexNumber (remainder color 16)))
))

;; Descripción: Se encarga de generar los numeros hexadecimales
(define hexNumber (lambda (n)
    (if (and (<= n 9) (>= n 0))
        (toStringElement n)
        (if (= n 10)
            "A"
            (if (= n 11)
                "B"
                (if (= n 12)
                    "C"
                    (if (= n 13)
                        "D"
                        (if (= n 14)
                            "E"
                            (if (= n 15)
                                "F"
                                null
                            )
                        )
                    )
                )
            )
        )
    )
))

;; histogram
;; Descripción: Retorna un histograma de frecuencias a partir de los colores en cada una de las imágenes. Debe funcionar para bitmap-d, pixmap-d y hexmap-d.
;; Dom: 
;; Rec:
;; Tipo de recursión:

(define histogram (lambda (IMG)
    (if (bitmap? IMG)
        (histogramBit (elementsPix IMG) 1)
        (if (pixmap? IMG)
            (histogramRgb (myMap colorsRgb (elementsPix IMG)) (firstElement (myMap colorsRgb (elementsPix IMG))))
            (if (hexmap? IMG)
                (histogramHex (myMap colorsHex (elementsPix IMG)) (firstElement (myMap colorsHex (elementsPix IMG))))
                null
            )
        )
    )
))

(define histogramBit (lambda (L i)
    (if (= i 0)
        (cons (list i (length (myFilter2 bitColorVerification i L))) null)
        (cons (list i (length (myFilter2 bitColorVerification i L))) (histogramBit L (- i 1)))
    )
))

;; Descripción: verifica si 2 colores bit son iguales
(define bitColorVerification (lambda (L i)
    (if (= i (getBit L))
        #t
        #f
    )
))

(define histogramRgb (lambda (L element)
    (if (= (length L) 1)
        (cons (list element 1) null)
        (cons (list element (length (myFilter2 verificationRgb element L)))  (histogramRgb (myFilter2 notRgb element L) (firstElement (myFilter2 notRgb element L))) )
    )
))

;; Descripción: verifica si 2 colores RGB no son iguales
(define notRgb (lambda (L element)
    (if (not (equal? L element))
        #t
        #f
    )
))

;; Descripción: verifica si 2 colores RGB son iguales
(define verificationRgb (lambda (L element)
    (if (equal? L element)
        #t
        #f
    )
))

;; Descripción: operación de buscar los colores R G B de un pixrgb
(define colorsRgb (lambda (L)
    (if (null? L)
        null
        (list (getR L) (getG L) (getB L))
    )
))

(define histogramHex (lambda (L element)
    (if (= (length L) 1)
        (cons (list element 1) null)
        (cons (list element (length (myFilter2 verificationHex element L)))  (histogramHex (myFilter2 notHex element L) (firstElement (myFilter2 notHex element L))) )
    )
))

;; Descripción: operación de buscar los colores hexadecimales de un pixhex
(define colorsHex (lambda (L)
    (if (null? L)
        null
        (getHex L)
    )
))

;; Descripción: verifica si 2 elementos hexadecimales no son iguales
(define notHex (lambda (L element)
    (if (not (equal? L element))
        #t
        #f
    )
))

;; Descripción: verifica si 2 elementos hexadecimales son iguales
(define verificationHex (lambda (L element)
    (if (equal? L element)
        #t
        #f
    )
))

; (define img5 (imgRGB->imgHex img4))
; (myMap colorsHex (elementsPix img5))

;; rotate90
;; Descripción: rota la imágen 90° a la derecha.
;; Dom: image (list)
;; Rec: image (list)
;; Tipo de recursión:

(define rotate90 (lambda (IMG)
    (flipV (imageList (getWidth IMG) (getHeight IMG) (append (rotate90Aux (height IMG) 0 (elementsPix IMG)) (myFilter notPosYAndPosXVerification (elementsPix IMG)))))
))
 
(define rotate90Aux (lambda (i n L)
   (if (= i 0)
    (append (myMap2 newPosXAndPosY n (myFilter2 posYAndPosXVerification i  L)))
    (append (myMap2 newPosXAndPosY n (myFilter2 posYAndPosXVerification i  L)) (rotate90Aux (- i 1) (+ n 1) L))
   )
))

;; Descripción: condición que verifica el valor de la coordenada X e Y
(define posYAndPosXVerification (lambda (L i)
    (if (and (= i (getPosY L)) (= i (getPosX L)) )
        #t
        #f
    )
))

;; Descripción: condición que verifica el valor de la coordenada X e Y negado
(define notPosYAndPosXVerification (lambda (L)
    (if (not (= (getPosX L) (getPosY L)))
        #t
        #f
    )
))

;; Descripción: operación que modifica la coordenada X e Y 
(define newPosXAndPosY (lambda (L n)
    (if (pixbit-d? L)
        (pixbit-d n n (getBit L) (getDepth L))
        (if (pixrgb-d? L)
            (pixrgb-d n n (getR L) (getG L) (getB L) (getDepth L))
            (if (pixhex-d? L)
                (pixhex-d n n (getHex L) (getDepth L))
                null
            )
        )
    )
))

;; compress
;; Descripción: Comprime una imágen eliminando aquellos pixeles con el color más frecuente. La imagen comprimida resultante solo se puede manipular con las otras funciones una vez que haya sido descomprimida a partir de la función señalada más adelante.
;; Dom: 
;; Rec:
;; Tipo de recursión:

(define compress (lambda (IMG)
    (if (bitmap? IMG)
        (list (imageList (getWidth IMG) (getHeight IMG) (myFilter2 verificationBitFrecuency (mostFrecuencyColor IMG) (elementsPix IMG))) (mostFrecuencyColor IMG) (myMap depthInfo (myFilter2 verificationBitFrecuencyAux (mostFrecuencyColor IMG) (elementsPix IMG))))
        (if (pixmap? IMG)
            (list (imageList (getWidth IMG) (getHeight IMG) (myFilter2 verificationRgbFrecuency (mostFrecuencyColor IMG) (elementsPix IMG))) (mostFrecuencyColor IMG) (myMap depthInfo (myFilter2 verificationRgbFrecuencyAux (mostFrecuencyColor IMG) (elementsPix IMG))))
            (if (hexmap? IMG)
                (list (imageList (getWidth IMG) (getHeight IMG) (myFilter2 verificationHexFrecuency (mostFrecuencyColor IMG) (elementsPix IMG))) (mostFrecuencyColor IMG) (myMap depthInfo (myFilter2 verificationHexFrecuencyAux (mostFrecuencyColor IMG) (elementsPix IMG))))
                null
            )
        )
    )
))

(define mostFrecuencyColor (lambda (IMG)
    (firstElement (firstElement (myFilter2  findPixelInfoByFrecuency (mostFrecuencyNumber IMG) (histogram IMG))))
))

(define mostFrecuencyNumber (lambda (IMG)
    (firstElement (sort (myMap frecuencyListGenerator (histogram IMG)) >))
))

;; Descripción: operación de buscar frecuencias de color
(define frecuencyListGenerator (lambda (L)
    (if (null? L)
        null
        (firstElement (firstElementRemove L))
    )
))

(define findPixelInfoByFrecuency (lambda (L i)
    (if (= (firstElement (firstElementRemove L)) i)
        #t
        #f
    )
))

(define verificationBitFrecuency (lambda (L i)
    (if (not (= (getBit L) i))
        #t
        #f
    )
))

(define verificationBitFrecuencyAux (lambda (L i)
    (if (= (getBit L) i)
        #t
        #f
    )
))

(define verificationRgbFrecuency (lambda (L i)
    (if (not (equal? (list (getR L) (getG L) (getB L)) i))
        #t
        #f
    )
))

(define verificationRgbFrecuencyAux (lambda (L i)
    (if (equal? (list (getR L) (getG L) (getB L)) i)
        #t
        #f
    )
))

(define verificationHexFrecuency (lambda (L i)
    (if (not (equal? (getHex L) i))
        #t
        #f
    )
))

(define verificationHexFrecuencyAux (lambda (L i)
    (if (equal? (getHex L) i)
        #t
        #f
    )
))

(define depthInfo (lambda (L)
    (if (null? L)
        null
        (getDepth L)
    )
))

;; edit
;; Descripción: Permite aplicar funciones especiales a las imágenes. Por ejemplo, para modificar colores en alguno de los canales, pasar a blanco y negro, etc.
;; Dom: f (función) , image (list)
;; Rec: image (list)
;; Tipo de recursión: De cola

(define edit (lambda (f IMG)
    (imageList (getWidth IMG) (getHeight IMG) (myMap f (elementsPix IMG)))
))

;; invertColorBit
;; Descripción: Función que permite obtener el valor del bit opuesto.
;; Dom: pixbit-d (list)
;; Rec: pixbit-d (list)
;; Tipo de recursión: NA

(define invertColorBit (lambda (L)
    (if (pixbit-d? L)
        (if (= (getBit L) 0)
            (pixbit-d (getPosX L) (getPosY L) 1 (getDepth L))
            (if (= (getBit L) 1)
                (pixbit-d (getPosX L) (getPosY L) 0 (getDepth L))
                null
            )
        )
        L
    )
))

;; invertColorRGB
;; Descripción: Función que permite obtener el color simétricamente opuesto en cada canal dentro de un pixel.
;; Dom: pixrgb-d (list)
;; Rec: pixrgb-d (list)
;; Tipo de recursión: NA

(define invertColorRGB (lambda (L)
    (if (pixrgb-d? L)
        (pixrgb-d (getPosX L) (getPosY L) (- 255 (getR L)) (- 255 (getG L)) (- 255 (getB L)) (getDepth L))
        L
    )
))

;; adjustChannel
;; Descripción: Función que permite ajustar cualquier canal de una imagen con pixeles pixrgb-d, incluido el canal de profundidad d. Se asume que la función que modificará el canal produce valores dentro del rango válido.
;; Dom: 
;; Rec:
;; Tipo de recursión:

(define adjustChannel
    (lambda (f1)
        (lambda (f2) 
            (lambda (f3) 
                (lambda (pix) 
                    (f3 (f2 (f1 pix)) pix)
                )
            )
        )
    )
)


(define incCh (lambda (n)
    (if (= n 255)
        0
        (+ n 1)
    )
))

(define setR (lambda (elementR L)
    (pixrgb-d (getPosX L) (getPosY L) elementR (getG L) (getB L) (getDepth L))
))

; ((((adjustChannel getR) incCh) setR) negro-rgb)

;; image->string
;; Descripción: Función que transforma una imagen a una representación string. La transformación depende de si la imagen es bitmap-d, hexmap-d o pixmap-d, para lo cual se pasa la función de transformación correspondiente.
;; Dom: funcion (fn), image (list)
;; Rec: string
;; Tipo de recursión: Natural

; (image->string pixbit->string img2)

(define image->string (lambda (f IMG)
    (image->stringAux f (elementsPix IMG) 0 (height IMG))
))

(define image->stringAux (lambda (f L y n)         
    (if (= y n)
      (string-append (example2 (myMap3 f (myFilter2 posYVerification y L))))
      (string-append (example2 (myMap3 f (myFilter2 posYVerification y L))) (image->stringAux f L (+ y 1) n))
    )
))

(define example2 (lambda (listColor)
    (string-join listColor " " 
        #:after-last "\n")
))
 
;; depthLayers
;; Descripción: Función que permite separar una imágen en capas en base a la profundidad en que se sitúan los pixeles. El resultado consiste en una lista de imágenes donde cada una agrupa los píxeles que se sitúan en el mismo nivel de profundidad. Además, en las imágenes resultantes se sustituyen los píxeles que se encuentran en otro nivel de profundidad por píxeles blancos (255,255,255).
;; Dom: img
;; Rec: lista de imagenes
;; Tipo de recursión: Natural

(define depthLayers (lambda (IMG) 
    (myMap depthLayersGenerator (pixelsByDepth IMG))
))

(define depthLayersGenerator (lambda (L)
    (if (bitmap? L)
        (imageList (getWidth L) (getHeight L)  (append (elementsPix L) (depthLayersAux2 (createPixelPositionLayers L) 0 (getDepth (firstElement (elementsPix L))) (length (createPixelPositionLayers L)))))
        (if (pixmap? L)
            (imageList (getWidth L) (getHeight L)  (append (elementsPix L) (depthLayersAux2 (createPixelPositionLayers L) (list 0 0 0) (getDepth (firstElement (elementsPix L))) (length (createPixelPositionLayers L)))))
            (if (hexmap? L)
                (imageList (getWidth L) (getHeight L)  (append (elementsPix L) (depthLayersAux2 (createPixelPositionLayers L) "FFFFFF" (getDepth (firstElement (elementsPix L))) (length (createPixelPositionLayers L)))))
                null
            )
        )
    ) 
))

(define depthLayersAux2 (lambda (pixelPositions pixelColor depthsOfPixels i)
    (if (= i 0)
        null
        (cons (flatten (list (firstElement pixelPositions) pixelColor depthsOfPixels )) (depthLayersAux2 (firstElementRemove pixelPositions) pixelColor depthsOfPixels (- i 1)))
    )
))

(define createPixelPositionLayers (lambda (IMG)
    (myMap positionsPixel (myFilter2 findPositions 0 (depthLayersAux IMG)))
))

(define depthLayersAux (lambda (IMG)
    (missingCoordinates (coordinateGenerator IMG) (myMap coordinatesImagec (elementsPix IMG)))
))

(define pixelsByDepth (lambda (IMG)
   (pixelsByDepthAux IMG (depthsOfAllPixels IMG) (elementsPix IMG))
))

(define pixelsByDepthAux (lambda (IMG L L2)
    (if (= (length L) 1)
        (cons (imageList (getWidth IMG) (getHeight IMG) (myFilter2 compareDepth (firstElement L) L2)) null)
        (cons (imageList (getWidth IMG) (getHeight IMG) (myFilter2 compareDepth (firstElement L) L2)) (pixelsByDepthAux IMG (myFilter2 compareElementInNegation (firstElement L) L) (myFilter2 compareDepthInNegation (firstElement L) L2)))
    )
))
 
(define depthsOfAllPixels (lambda (L)
    (myMap firstElement (depthsAgrupation (myMap returnDepths (elementsPix L)) (elementsPix L)))
))

(define returnDepths (lambda (pixel)
    (if (null? pixel)
        null
        (getDepth pixel)
    )
))

(define depthsAgrupation (lambda (L L2)
    (if (= (length L) 1)
        (cons (list (firstElement L) (length (myFilter2 compareDepth (firstElement L) L2))) null)
        (cons (list (firstElement L) (length (myFilter2 compareDepth (firstElement L) L2))) (depthsAgrupation (myFilter2 compareElementInNegation (firstElement L) L) (myFilter2 compareDepthInNegation (firstElement L) L2)))
    )
))

(define compareDepthInNegation (lambda (L i)
    (if (not (equal? (getDepth L) i))
        #t
        #f
    )
))

(define compareDepth (lambda (L i)
    (if (equal? (getDepth L) i)
        #t
        #f
    )
))

(define compareElementInNegation (lambda (L i)
    (if (not (equal? L i))
        #t
        #f
    )
))

;; decompress
;; Descripción: Función que permite descomprimir una imágen comprimida. Para esto se toma como referencia el color más frecuente a fin de reconstruir todos los píxeles que fueron eliminados en la compresión.
;; Dom: 
;; Rec:
;; Tipo de recursión:  

(define decompress (lambda (IMGC)
    (imageList (getWidth (compressedImage IMGC)) (getHeight (compressedImage IMGC))  (append (elementsPix (compressedImage IMGC)) (decompressAux (createPixelPosition IMGC) (colorOfPixelsDeleted IMGC) (depthsOfPixelsDeleted IMGC) (length (createPixelPosition IMGC)))))
))

(define decompressAux (lambda (pixelPositions pixelColor depthsOfPixels i)
    (if (= i 0)
        null
        (cons (flatten (list (firstElement pixelPositions) pixelColor (firstElement depthsOfPixels))) (decompressAux (firstElementRemove pixelPositions) pixelColor (firstElementRemove depthsOfPixels) (- i 1)))
    )
))

;; Descripción: a partir de 
(define createPixelPosition (lambda (IMGC)
    (myMap positionsPixel (myFilter2 findPositions 0 (missingElements IMGC)))
))

(define positionsPixel (lambda (L)
    (firstElement L)
))

(define findPositions (lambda (L i)
    (if (= (lastElement L) i)
        #t
        #f
    )
))

(define missingElements (lambda (IMGC)
    (missingCoordinates (coordinateGenerator (compressedImage IMGC)) (myMap coordinatesImagec (elementsPix (compressedImage IMGC))))
))

(define missingCoordinates (lambda (L L2)
    (if (= (length L) 1)
        (cons (list (firstElement L) (length (myFilter2 missingAux (firstElement L) L2))) null)
        (cons (list (firstElement L) (length (myFilter2 missingAux (firstElement L) L2))) (missingCoordinates (firstElementRemove L) (myFilter2 missingNotAux (firstElement L) L2)))
    )
))

;; Descripción: a partir de la imagen comprimida extrae la data del las profundidades de los pixeles borrados
(define depthsOfPixelsDeleted (lambda (IMGC)
    (lastElement (firstElementRemove IMGC))
))

;; Descripción: a partir de la imagen comprimida extrae la data del color de los pixeles borrados
(define colorOfPixelsDeleted (lambda (IMGC)
    (firstElement (firstElementRemove IMGC))
))

;; Descripción: a partir de la imagen comprimida extrae la data de la imagen sin los pixeles borrados
(define compressedImage (lambda (IMGC)
    (firstElement IMGC)
))

;; Descripción: a partir de una imagen con los pixeles borrados genera las coordenadas que deberia tener la imagen descomprimida
(define coordinateGenerator (lambda (IMG)
    (reverse (row (width IMG) (height IMG)))
))

;; Descripción: se encarga de generar coordenadas de una imagen
(define row (lambda (x y)
    (if (= 0 x)
        (append (column x y) null)
        (append (column x y) (row (- x 1) y))
    )
))

(define column (lambda (x y)
    (if (= y 0)
        (cons (list x y) null)
        (cons (list x y) (column x (- y 1)))    
    )  
))

;; Descripción: retorna las coordenadas de un pixel
(define coordinatesImagec (lambda (L)
    (if (null? L)
        null
        (list (getPosX L) (getPosY L))
    )
))

;; Descripción: Compara dos coordenadas verificando que NO son iguales
(define missingNotAux (lambda (L i)
    (if (not (equal? L i))
        #t
        #f
    )
))

;; Descripción: Compara dos coordenadas verificando que son iguales
(define missingAux (lambda (L i)
    (if (equal? L i)
        #t
        #f
    )
))

;; orderPixels

(define orderPixels (lambda (IMG)
    (orderPixelsAux (coordinateGenerator IMG) (elementsPix IMG))
))

(define orderPixelsAux (lambda (L E)
    (if (= (length L) 1)
        (append (myFilter2 isCoordinate (firstElement L) E) null)
        (append (myFilter2 isCoordinate (firstElement L) E) (orderPixelsAux (firstElementRemove L) (myFilter2 notCoordinate (firstElement L) E)))
    )
))

(define isCoordinate (lambda (pixFromE element)
    (if (equal? element (list (getPosX pixFromE) (getPosY pixFromE)))
        #t
        #f
    )
))

(define notCoordinate (lambda (pixFromE element)
    (if (not (equal? element (list (getPosX pixFromE) (getPosY pixFromE))))
        #t
        #f
    )
))
