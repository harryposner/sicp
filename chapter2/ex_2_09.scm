;;; Exercise 2.9

(define (width interval)
  (/ (- (upper-bound interval)
        (lower-bound interval))
     2))

;;; Consider two intervals, (a, b) and (c, d).  The width of (a, b) is b - a,
;;; and the width of (c, d) is d - c.  The sum of the two intervals is (a + c,
;;; b + d), the width of which is b+d - (a+c) = (b-a) + (d-c).  The difference
;;; between the two intervals is (c - b, d - a), the width of which is (d-a) -
;;; (c-b) = (d-c) + (b-a).  The widths of both the sum and the difference can
;;; be calculated in terms of the width of the original intervals.

;;; Counterexample for multiplication (mul-interval defined in exercise 2.11):
(width (mul-interval (make-interval 1 2) (make-interval 3 4)))
; 5/2
(width (mul-interval (make-interval 5 6) (make-interval 7 8)))
; 13/2

;;; Counterexample for division (div-interval defined in exercise 2.10)
(width (div-interval (make-interval 1 2) (make-interval 3 4)))
; 5/24
(width (div-interval (make-interval 5 6) (make-interval 7 8)))
; 13/112
