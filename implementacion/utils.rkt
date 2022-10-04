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

(define myFilter2 (lambda (f i L)
        (if (null? L)
            null
            (if (f (car L) i)
                (cons (car L) (myFilter2 f i (cdr L)))
                (myFilter2 f i (cdr L))
            )
        )
    )   
)

(define myFilter3 (lambda (f x y L)
        (if (null? L)
            null
            (if (f (car L) x y)
                (cons (car L) (myFilter3 f x y (cdr L)))
                (myFilter3 f x y (cdr L))
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

(define myMap2 (lambda (f i L)
            (if (null? L)
            null
            (cons (f (car L) i) (myMap2 f i (cdr L)))
        )
    )
)
;;;
(define myMap3 (lambda (f L)
            (if (null? L)
            null
            (append (list (f (car L))) (myMap3 f (cdr L)))
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

;; Descripción: retorna el ultimo elemento de la lista
;; Dom: list 
;; Rec: element
;; Tipo de recursión: NA

(define lastElement (lambda (L)
    (car (reverse L))
))

;; Descripción: elimina el primer elemento de la lista
;; Dom: list 
;; Rec: element
;; Tipo de recursión: NA

(define firstElementRemove cdr)

;; Descripción: Transforma un elemento entero a string
;; Dom: x (int)
;; Rec: x (str)
;; Tipo de recursión: natural

(define toStringElement (lambda (x)
    (if (integer? x)
        (~a x)
        null
    )
))

;; Descripción: retorna el largo de un string

(define strLength string-length)


;; Descripción: retorna el largo de un list
 
(define listLength length)

;; Descripción: retorna un booleano como verificacion si un elemento es falso

(define isFalse? false?)
