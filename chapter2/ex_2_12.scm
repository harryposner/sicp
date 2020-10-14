;;; Exercise 2.12

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (make-center-percent center percent-tol)
  (let ((width (abs (* center (/ percent-tol 100)))))
    (make-interval (- center width) (+ center width))))

(define (percent interval)
  (abs (* 100  (/ (width interval) (center interval)))))
