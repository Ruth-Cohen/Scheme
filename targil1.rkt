#lang racket
; תרגיל 1, רות שפנייר 316213164 חוה אדלר 315582403
;בדיקה מהנה
;1.a
(define l1 (cons 'apple (cons 'orange (cons 'pear (cons 'grapefruit null)))))
l1
> (define l2 (cons 'apple (cons 'orange null)))
l2
(define l3 (cons 'pear (cons 'grapefruit null)))
l3
(define l5 (cons(cons l2 null) (cons(cons l3 null)null)))
l5
(define l4 (cons (cons 'apple null) (cons (cons 'orange null) (cons(cons 'pear null) (cons(cons 'grapefruit null)null) ))))
l4
(define l6(cons 'apple (cons(cons 'orange null)  (cons(cons(cons 'pear null)null) (cons(cons(cons(cons 'grapefruit null)null)null)null)))))
l6
;1.b
(define l7(list 'apple 'orange 'pear 'grapefruit))
l7
 (define l8(list (list 'apple 'orange) (list 'pear 'grapefruit)))
l8
(define l9(list( list(list 'apple ) (list 'orange ) (list 'pear) (list 'grapefruit))))
l9
(define l10(list 'apple (list 'orange) (list(list 'pear)) (list(list(list 'grapefruit)))))
l10
;1.c
(define l11 '(apple orange pear grapefruit))
l11
(define l12'((apple orange) (pear grapefruit)))
l12
(define l13'(((apple) (orange) (pear) (grapefruit))))
l13
(define l14'(apple (orange) ((pear)) (((grapefruit)))))
l14
;2
(car(cdr(cdr l11)))
(car(car(cdr l12)))
(car(car(cdr(cdr(car l13)))))
(car(car(car(cdr(cdr l14)))))
;3
(car(cddr l11))
(car(cadr l12))
(car(car(cdr(cdr(car l13)))))
(car(cadr (cdar l13)))
(car(caar(cddr l14)))
;4
(append  '(a b c) null)
(list  '(a b c) null)
(cons '(a b c) '())
(append '(a b c) '(reverse (a b c))  (reverse '(a b c)))
;5
(/(+ 3 1)(- 3 1))
;6
(* (max 3 4 5) (min 3 4 5))
(min (max 3 1 4) (max 2 7 1))













