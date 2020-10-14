; Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (tetrate base height)
  (define (iter counter accumulator)
    (if (= counter height)
      accumulator
      (iter (+ counter 1) (expt base accumulator))))
  (iter 0 1))

(= (A 1 10) (expt 2 10))

(= (A 2 4) (A 1 (A 2 3)))
(= (A 2 4) (expt 2 (A 2 3)))
(= (A 2 4) (expt 2 (expt 2 (expt 2 (expt 2 1)))))
(= (A 2 4) (tetrate 2 4))

(= (A 3 3) (A 2 (A 3 2)))
(= (A 3 3) (tetrate 2 (A 3 2)))
(= (A 3 3) (tetrate 2 (tetrate 2 (tetrate 2 1))))

(define (f n) (A 0 n))
; f(n) = 2n
(define (g n) (A 1 n))
; g(n) = 2^n
(define (k n) (A 2 n))
; k(n) = (tetrate 2 n)
