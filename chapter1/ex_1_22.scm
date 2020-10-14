;;; Exercise 1.22
;;; Modified timed-prime-test so it only displays if n is prime.  This makes
;;; the output more readable below when when test a large range of numbers.
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (begin
      (newline)
      (display n)
      (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  elapsed-time)


(define (search-for-primes lbound ubound)
  (define (iter to-test)
    (if (not (> to-test ubound))
      (begin
        (timed-prime-test to-test)
        (iter (+ to-test 2)))))
  (define start-num
    (if (even? lbound)
      (+ lbound 1)
      lbound))
  (iter start-num))


(sqrt 10)
;;; 3.16 --- so for each order of magnitude we go up, the time to test
;;; primality should be about 3.16x as long.

(search-for-primes (expt 10 11) (+ (expt 10 11) 100))

;;; In MIT Scheme:
;;; 100000000003 *** .40000000000009095
;;; 100000000019 *** .40000000000009095
;;; 100000000057 *** .38999999999987267
;;; 100000000063 *** .40000000000009095
;;; 100000000069 *** .41000000000030923
;;; 100000000073 *** .3999999999996362
;;; 100000000091 *** .41000000000030923
;;; ;Unspecified return value

(search-for-primes (expt 10 12) (+ (expt 10 12) 100))

;;; In MIT Scheme:
;;; 1000000000039 *** 1.2600000000002183
;;; 1000000000061 *** 1.2899999999999636
;;; 1000000000063 *** 1.2699999999999818
;;; 1000000000091 *** 1.2699999999999818
;;; ;Unspecified return value

;;; Yep, that looks about 3 times as long
