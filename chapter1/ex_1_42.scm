;;; Exercise 1.42
(define (compose f g) (lambda (x) (f (g x))))

((compose square inc) 6)
; 49
