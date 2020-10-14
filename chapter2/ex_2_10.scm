;;; Exercise 2.10

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
      (error "Divisor interval spans zero")
      (mul-interval x
                    (make-interval
                      ;;; Why divide into 1.0?  Unary division gives
                      ;;; reciprocal and can be exact.
                      (/ (upper-bound y))
                      (/ (lower-bound y))))))
