#lang racket
;targil 3
;RUT SPANIER 316213164
;Chavi Adler 315582403
;------3.1-----
(define months '((jan . 31) (feb (28 . 29)) (mar . 31) (apr . 30) (may . 31) (jun . 30) (jul . 31) (aug . 31) (sep . 30) (oct . 31) (nov . 30) (dec . 31)))
(define (dayscount taarich)
  (if (and (list? taarich)(= (length taarich) 3)(number? (car taarich))(integer? (car taarich))(assoc(cadr taarich) months)(number? (caddr taarich))(integer? (car taarich)))
      (SumOfDay taarich months)
      'error))
 (define(SumOfDay taarich listMonths [sum 0])
   (cond((equal? (cadr taarich) (caar listMonths))(+ sum (car taarich)))
        ((equal? (caar listMonths) 'feb)
        (if (YearKind taarich)
            (SumOfDay taarich (cdr listMonths) (+ sum 29))
            (SumOfDay taarich (cdr listMonths) (+ sum 28))))
        ((SumOfDay taarich (cdr listMonths) (+ sum (cdar listMonths))))))

(define(YearKind taar)
  (or (and (= (modulo (caddr taar) 4) 0) (not (= (modulo (caddr taar) 100) 0)))((= (modulo (caddr taar) 400) 0))))
;------3.2-------
(define(checknum N)
  (if (and (integer? N)(> N 0))
      (cond((=( modulo N (* 3 5 7))0) '(Bim Bam Bum))
           ((and(=( modulo N 3)0)(not(=(modulo N (* 5 7))0))) '( Bim))
           ((and(=( modulo N 5)0)(not(=(modulo N (* 3 7))0))) '( Bam))
           ((and(=( modulo N 7)0)(not(=(modulo N (* 3 5))0))) '( Bum))
           ((and(=( modulo N (* 3 5))0)(not(=(modulo N  7)0))) '(BimBam))
           ((and(=( modulo N (* 5 7))0)(not(=(modulo N  3)0))) '(BamBum))
           ((and(=( modulo N (* 3 7))0)(not(=(modulo N  5)0))) '(BimBum)))
      '(else)))
;answer
; (checknum 105)
;'(Bim Bam Bum)

;------3.3------
(define (middlenum L)
  (if(and(=(length L)3)(list? L)(not(or(equal? (car L) (cadr L))(equal? (car L) (caddr L)) (equal? (cadr L)(caddr L)))))
     (let* ((x (car L)) (y (cadr L)) (z (caddr L)))
     (if(not(or(eq? x (max x y z)) (eq? x (min x y z)))) x
        (if(not(or(eq? y (max x y z)) (eq? y (min x y z)))) x z))) '(ERROR_BY_'Middlenum'_FUNC)))
;answer
;(middlenum '(34 120 25))
;34
;(middlenum '(34 34 25))
;'(ERROR_BY_ 'Middlenum '_FUNC)

;------3.4-------
(define (num2digit N) (if(and(integer? N)(> N 0)(= 3(let* ((tmp N)(tmp1(string->list(number->string tmp)))) (length tmp1))))
                         (let*((N(number->string N))(N1(substring N 0 1))(N2(substring N 1 2)) (N3(substring N 2 3)))
                           (middlenum(append(list(string->number N1)(string->number N2)(string->number N3))))) '(ERROR_BY_'num2digit'_FUNC)))
;answer
;(num2digit 928)
;8
                          
                         
           
           
  
