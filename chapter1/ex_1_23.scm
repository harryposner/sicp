;;; Exercise 1.23

(define (next n)
  (if (= n 2)
    3
    (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else
          (find-divisor n (next test-divisor)))))

;;; The other definitions are under exercises 1.21 and 1.22.

(search-for-primes (expt 10 11) (+ (expt 10 11) 100))

;;; 100000000003 *** .23000000000000004
;;; 100000000019 *** .23999999999999994
;;; 100000000057 *** .22999999999999998
;;; 100000000063 *** .2300000000000001
;;; 100000000069 *** .22999999999999998
;;; 100000000073 *** .24
;;; 100000000091 *** .24
;;; ;Unspecified return value

(search-for-primes (expt 10 12) (+ (expt 10 12) 100))

;;; 1000000000039 *** .7399999999999998
;;; 1000000000061 *** .7199999999999998
;;; 1000000000063 *** .7199999999999998
;;; 1000000000091 *** .7200000000000006
;;; ;Unspecified return value

;;; That just a bit slower than twice as fast.  Perhaps there's some overhead
;;; from calling next that we don't get from a builtin like +?
