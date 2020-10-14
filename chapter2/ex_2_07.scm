;;; Exercise 2.7
(define (make-interval a b) 
  (if (<= a b)
      (cons a b)
      (error "Upper bound less than lower bound: MAKE-INTERVAL" a b)))

(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))
