;;; Exercise 2.20
(define (filter predicate? ls)
  (cond ((null? ls)
         ls)
        ((predicate? (car ls))
         (cons (car ls) (filter predicate? (cdr ls))))
        (else (filter predicate? (cdr ls)))))

(define (same-parity first . rest)
  (cons
    first
    (filter (lambda (x) (= (remainder x 2) (remainder first 2))) rest)))
