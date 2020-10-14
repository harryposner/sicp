;; Exercise 1.12

;;; indexing from zero, element is from left to right
(define (pascal row element)
  (if (or (= row 0) (= element 0) (= element row))
    1
    (+ (pascal (dec row) (dec element))
       (pascal (dec row) element))))
