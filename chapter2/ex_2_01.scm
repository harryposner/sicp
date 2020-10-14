;;; Exercise 2.1

(define (make-rat n d)
  (let ((g
          (if (< d 0)
            (- (gcd n d))
            (gcd n d))))
    (cons (/ n g)
          (/ d g))))

(equal? (make-rat 1 2) (make-rat -1 -2))
; #t
(equal? (make-rat 1 -2) (make-rat -1 2))
; #t
