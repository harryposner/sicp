;;; Exercise 2.11

(define (mul-interval x y)
  (let ((x-min (lower-bound x))
        (x-max (upper-bound x))
        (y-min (lower-bound y))
        (y-max (upper-bound y)))
    (cond
      ;;; Both intervals have the same sign
      ((and (> x-min 0) (> y-min 0))
       (make-interval (* x-min y-min) (* x-max y-max)))
      ((and (< x-max 0) (< y-max 0))
       (make-interval (* x-max y-max) (* x-min y-min)))
      ;;; Intervals have opposite signs
      ((and (< x-max 0) (> y-min 0))
       (make-interval (* x-min y-max) (* x-max y-min)))
      ((and (> x-min 0) (< y-max 0))
       (make-interval (* x-max y-min) (* x-min y-max)))
      ;;; Lesser interval spans zero and greater interval is positive
      ((and (<= x-min 0) (>= x-max 0) (> y-min 0))
       (make-interval (* x-min y-max) (* x-max y-max)))
      ((and (<= y-min 0) (>= y-max 0) (> x-min 0))
       (make-interval (* x-max y-min) (* x-max y-max)))
      ;;; Greater interval spans zero and lesser interval is negative
      ((and (<= x-min 0) (>= x-max 0) (< y-max 0))
       (make-interval (* x-max y-min) (* x-min y-min)))
      ((and (<= y-min 0) (>= y-max 0) (< x-max 0))
       (make-interval (* x-min y-max) (* x-min y-min)))
      ;;; Both intervals span zero
      ((and (<= x-min 0) (>= x-max 0) (<= y-min 0) (>= y-max 0))
       (make-interval
         (min (* x-min y-max) (* x-max y-min))
         (max (* x-max y-max) (* x-min y-min)))))))
