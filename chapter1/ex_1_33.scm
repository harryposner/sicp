;;; Exercise 1.33

(define (filtered-accumulate combiner null-value term a next b predicate?)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (predicate? a)
                  (combiner result (term a))
                  result))))
  (iter a null-value))

(define (recursive-filtered-accumulate
          combiner null-value term a next b predicate?)
  (if (> a b)
      null-value
      (combiner
        (if (predicate? a)
            (term a)
            null-value)
        (recursive-filtered-accumulate
          combiner null-value term (next a) next b predicate?))))

(define (sum-square-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (relative-prime-product n)
  (define (relative-prime? i)
    (= 1 (gcd i n)))
  (filtered-accumulate * 1 identity 1 inc n relative-prime?))
