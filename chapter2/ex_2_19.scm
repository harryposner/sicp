;;; Exercise 2.19

(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

;;; Order doesn't matter.  We're enumerating every possible way to make change
;;; with the given set of coins.  Changing the order of the list will change
;;; the order in which we check each of those ways to make change, but
;;; regardless, we still check every single one.  You could write the
;;; definition of `cc` using unordered sets, and it would still make sense.
