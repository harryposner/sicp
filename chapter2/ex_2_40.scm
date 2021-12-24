;;; Exercise 2.40
(define (unique-pairs n)
  (flatmap (lambda (i)
         (map (lambda (j) (list j i))
              (iota (- i 1) 1)))
       (iota (- n 1) 2)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))
