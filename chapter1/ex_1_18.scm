; Exercise 1.18

;;; Use double and halve from exercise 1.17

(define (peasant-mult x y)
  ;; The invariant quantity is x*y + acc
  (define (iter acc x y)
    (cond ((= y 0) acc)
          ((even? y) (iter acc (double x) (halve y)))
          ((< y 0) (iter (- acc x) x (+ y 1)))
          (else (iter (+ acc x) x (- y 1)))))
  (iter 0 x y))

(peasant-mult 7 0)
