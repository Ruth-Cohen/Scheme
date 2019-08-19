#lang racket
;targil_4
;Chavi Adler 315582403
;Ruth Spanier 316213164
(define (rangelst N [temp 2])
  (if (and (integer? N)(> N 0))
      (if (= temp (floor (/ N 2))) (cons temp '())
                                (cons temp (rangelst N (+ temp 1))))
      'ERROR))


(define (divisible? N M)
  (if(and (and (integer? N)(> N 0)) (and (integer? M)(> M 0)))
    (equal?( modulo N M)0)
    'ERROR))

(define (prime? N)
  (if (and  (> N 0) (integer? N))
      (if (<= N 3) #t
            (found? (rangelst  N) N))
   'error))

(define (found? L N)
  (cond ((null? L) #t)
    ((divisible?  N (car L) ) #f)
        (#t (found? (cdr L) N))))
;-----------2------------
(define (primes N)
   (if (and  (> N 0) (integer? N))
       (help (rangelst (* 2 N)))
     'error))

(define (help  L)
  (cond ((null? L) '())
        ( (not(prime?  (car L) )) (help (cdr L)))
        (#t (cons (car L) (help  (cdr L))))))


;----------3-------------
;יביסרוקר
;-----א---------
(define (Erathostenes1 N)
  (cond ((= 1 N) '(1))
      (#t(cons 1 (merge (rangelst (* 2 N))) ))))


(define (merge L)
  (cond ((null? L) '())
      (#t (cons (car L) (merge (filter (car L) (cdr L)))))))


(define (filter N L)
  (cond ((null? L) '())
        ((= 0 (modulo  (car L) N)) (filter N (cdr L)))
        (#t (cons (car L) (filter N (cdr L))))))

;תיבנז יביסרוקר
(define (Erathostenes2 N)
  (cond ((= 1 N) '(1))
      (#t(cons 1 (merge (rangelst (* 2 N))) ))))


(define (tailmerge L [tmp '()])
  (cond ((null? L) tmp)
      (#t (cons (car L) (tailmerge (tailfilter (car L) (cdr L)) tmp)))))

(define (tailfilter N L [tmp '()])
  (cond ((null? L) tmp)
        ((= 0 (modulo  (car L) N)) (tailfilter N (cdr L) tmp))
        (#t (tailfilter N (cdr L) (append tmp (list (car L)))))))
;----ב-----
(define (keep-if-something func L)
  (cond ((null? L) null)
        ((func (car L)) (cons (car L) (keep-if-something func (cdr L))))
        (else (keep-if-something func (cdr L)))))

(define (Erathostenes3 N)
  (cond ((= 1 N) '(1))
      (#t(cons 1 (keep-if-something prime? (rangelst (* 2 N)))))))
;------------4------------

(define (ziplst L1 L2)
  (define L3 '())
  (if (not(or (list? L1) (list? L2)))
     #f
      (ziplst_rec L1 L2 L3)
      ))

(define (ziplst_rec L1 L2 L3)
  (if (or (null? L1) (null? L2))
      L3
      ( append (append L3 (list(list (car L1) (car L2)))) (ziplst_rec (cdr L1) (cdr L2) L3))
      ))


  
             



  
  