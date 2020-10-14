;;; Exercise 1.24

;;; Definitions from the book:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

;;; Modified from Exercise 1.22

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
    (begin
      (newline)
      (display n)
      (report-prime (- (runtime) start-time)))))

;;; Definitions of timed-prime-test, report-prime, and search-for-primes are
;;; unmodified from Exercise 1.22.



(let ((lbound (expt 10 11)))
  (search-for-primes lbound (+ lbound 100)))

;;; 100000000003 *** 1.0000000000000009e-2
;;; 100000000019 *** 1.0000000000000009e-2
;;; 100000000057 *** 0.
;;; 100000000063 *** 0.
;;; 100000000069 *** 0.
;;; 100000000073 *** 9.999999999999981e-3
;;; 100000000091 *** 0.
;;; ;Unspecified return value

(let ((lbound (expt 10 12)))
  (search-for-primes lbound (+ lbound 100)))

;;; 1000000000039 *** 0.
;;; 1000000000061 *** 0.
;;; 1000000000063 *** 1.0000000000000009e-2
;;; 1000000000091 *** 0.
;;; ;Unspecified return value

;;; This a lot faster.
