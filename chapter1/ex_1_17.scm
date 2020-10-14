; Exercise 1.17
(define (double x) (+ x x))

;;; The problem says I should assume the language can only add and not
;;; multiply, so I'm going to assume I can't divide either.
(define (halve x)
  (define (try guess)
    (if (= (double guess) x)
      guess
      (+ guess (halve (- x (double guess))))))
  (cond ((> x 0) (try 1))
        ((= x 0) 0)
        ((< x 0) (try -1))))

(define (mult x y)
  (cond ((= y 1) x)
        ((= y -1) (- x))
        ((even? y) (mult (double x) (halve y)))
        (else (+ x (mult x (- y 1))))))
