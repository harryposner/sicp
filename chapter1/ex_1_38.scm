;;; Exercise 1.38

;;; Use definition of cont-frac from Exercise 1.37
(+ 2 (cont-frac (lambda (x) 1.0)
                (lambda (x)
                  (if (= (remainder x 3) 2)
                    (* 2 (ceiling (/ x 3)))
                    1))
                100))
; 2.7182818284590455
