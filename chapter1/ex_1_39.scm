;;; Exercise 1.39


;;; Use definition of cont-frac from Exercise 1.37
(define (tan-cf x k)
  (cont-frac
    (lambda (i) (if (= i 1) x (- (square x))))
    (lambda (i) (- (* i 2.0) 1.0))
    k))

(tan-cf (/ 3.141592 4) 100)
; 0.9999996732051568
