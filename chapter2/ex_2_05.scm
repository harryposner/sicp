;;; Exercise 2.5
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (get-element int-pair base count)
  (if (= 0 (remainder int-pair base))
      (get-element (/ int-pair base) base (+ count 1))
      count))

(define (car int-pair)
  (get-element int-pair 2 0))
(define (cdr int-pair)
  (get-element int-pair 3 0))
