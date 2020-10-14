;; Exercise 1.16

(define (fast-exp-iter base exponent)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 base exponent))

(= (fast-exp-iter 2 10) 1024)
(= (fast-exp-iter 3 4) 81)
