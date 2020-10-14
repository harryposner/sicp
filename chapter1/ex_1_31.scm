;;; Exercise 1.31

;;; Part 1
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product identity 1 inc n))

;;; It's easier to read the result when it's printed as a decimal, which is why
;;; I'm using floats.
(define (pi-product n)
  (define (term i)
    (/ (* 4.0 i (+ 1 i))
       (square (+ 1 (* 2.0 i)))))
  (* 4.0 (product term 1 inc n)))


;;; Part 2
(define (recursive-product term a next b)
  (if (> a b)
    1
    (* (term a) (recursive-product term (next a) next b))))
