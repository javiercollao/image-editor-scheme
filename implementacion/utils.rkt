#lang racket
(provide (all-defined-out))

;; ======================================================
;; TDA lista
;;
;; @author         :   Javier Collao
;; @representation :   El TDA lista solo contiene implementaciones propias para
;; utilizarlos en otros TDAs
;;

;; Descripción: retorna una lista de elementos que cumplen una condicion
;; Dom: funcionCondicion X lista
;; Rec: lista de elementos
;; Tipo de recursión: Natural

(define myFilter (lambda (f L)
        (if (null? L)
            null
            (if (f (car L))
                (cons (car L) (myFilter f (cdr L)))
                (myFilter f (cdr L))
            )
        )
    )   
)

;; Descripción: retorna una lista de elementos donde a cada elemento se le aplica una operacion
;; Dom: funcionOperacion X lista
;; Rec: lista de elementos
;; Tipo de recursión: Natural

(define myMap (lambda (f L)
            (if (null? L)
            null
            (cons (f (car L)) (myMap f (cdr L)))
        )
    )
)

;; Descripción: retorna un elemento que nace por una operacion que involucra a todos los elementos de una lista
;; Dom: funcionOperacion X lista
;; Rec: elemento
;; Tipo de recursión: Natural

(define myReduce (lambda (f L)
        (if (null? L)
            null
            (if (null? (cdr L))
                (car L)
                (f (car L) (myReduce f (cdr L)))
            )
        )
    )
)

;; Descripción: retorna el primer elemento de la lista
;; Dom: list 
;; Rec: element
;; Tipo de recursión: NA

(define firstElement car)

;; Descripción: elimina el primer elemento de la lista
;; Dom: list 
;; Rec: element
;; Tipo de recursión: NA

(define firstElementRemove cdr)


;; Descripción: retorna el largo de un string
;; Dom: string 
;; Rec: int
;; Tipo de recursión: NA

(define strLength string-length)
