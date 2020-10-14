;;; Exercise 1.44

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

;;; repeated defined in exercise 1.43
(define (n-fold-smooth f n)
  ((repeated smooth n) f))
