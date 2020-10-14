;;; Exercise 2.14

;;; Defined in the book:
(define (add-interval a b)
  (make-interval
    (+ (lower-bound a) (lower-bound b))
    (+ (upper-bound a) (upper-bound b))))

(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))

;;; Testing
(define (test-parallel parallel-fn interval1 interval2)
  (let ((parallelized (parallel-fn interval2 interval2)))
    (display parallelized)
    (newline)
    (display (percent parallelized))))

(define test-interval (make-center-percent 10.0 1.0))

(test-parallel par1 test-interval test-interval)
; (4.8519801980198025 . 5.152020202020202)
; 2.9992002399280135

(test-parallel par2 test-interval test-interval)
; (4.95 . 5.05)
; .9999999999999963


(percent (div-interval test-interval test-interval))
;Value: 1.9998000199979908

(percent (div-interval test-interval (make-center-percent 10 0.5)))
;Value: 1.4999250037498124

(percent (div-interval (make-interval 1 1) test-interval))
;Value: .9999999999999967


;;; It looks like dividing uncertain intervals adds their percentage
;;; uncertainties.  Using a certain interval (lbound=ubound) doesn't affect the
;;; uncertainy, which makes sense.

;;; Eva Lu Ator is right.  The reason is that, as written, there's no way for
;;; us to distinguish between two uncertain values and two instances of the
;;; same uncertain value.
