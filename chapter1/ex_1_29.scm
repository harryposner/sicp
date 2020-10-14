;;; Exercise 1.29

;;; Defined in the book
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (yk k) (f (+ a (* k h))))
    (define (term i) (* (* 2 (+ 1 (remainder i 2))) (yk i)))
    (* (/ h 3) (+ (yk 0) (yk n) (sum term 1 (lambda (x) (+ 1 x)) (- n 1))))))

(simpson (lambda (x) (expt x 3)) 0 1 100)

;;; I get the (exact) ratio 1/4 on MIT Scheme, Chicken Scheme, and Racket SICP
;;; mode.  The integral procedure defined in the book uses floats, not exacts,
;;; but if I change the 2.0 to a 2 and use 1/100 for dx, I get 19999/80000 for
;;; the integral of cube from 0 to 1.
