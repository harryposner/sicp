;; Exercise 1.1
10
;; 10
(+ 5 3 4)
;; 12
(- 9 1)
;; 8
(/ 6 2)
;; 3
(+ (* 2 4) (- 4 6))
;; 6
(define a 3)
;; N/A
(define b (+ a 1))
;; N/A
(+ a b (* a b))
;; 19
(= a b)
;; #f
(if (and (> b a) (< b (* a b)))
    b
    a)
;; 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;; 16
(+ 2 (if (> b a) b a))
;; 6
(* (cond ((> a b) a)
          ((< a b) b)
          (else -1))
    (+ a 1))
;; 16





(define (square x)
  (* x x))
(define (mean x y)
  (/ (+ x y) 2))

; Integer exponents, recursive process
(define (power base exponent)
  (cond ((> exponent 0) (* base (power (- exponent 1)) base))
        ((< exponent 0) (/ (power base (+ exponent 1)) base))
        (else 1)))

; Integer exponents, iterative process
(define (power base exponent)
  (define (iter counter accumulator)
    (cond ((> counter 0) (iter (- counter 1) (* accumulator base)))
          ((< counter 0) (iter (+ counter 1) (/ accumulator base)))
          (else accumulator)))
  (iter exponent 1))


(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (mean guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

;; Factorial, recursive process
(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))

;; Factorial, iterative process
(define (factorial n)
  (define (fact-iter counter product)
    (if (> counter n)
      product
      (fact-iter (+ counter 1) (* counter product))))
  (fact-iter 1 1))

; Exercise 1.9
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (inc (+ (dec 3) 5)) )
(inc (inc (+ 2 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)
9

; 1.10
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
      (iter (+ counter 1) (power base accumulator))))
  (iter 0 1))

(= (A 1 10) (power 2 10))

(= (A 2 4) (A 1 (A 2 3)))
(= (A 2 4) (power 2 (A 2 3)))
(= (A 2 4) (power 2 (power 2 (power 2 (power 2 1)))))
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

; 1.2.2
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (fib n)
  (define (iter a b counter)
    (if (= counter n)
      a
      (iter b (+ a b) (+ counter 1))))
  (iter 0 1 0))

; Exercise 1.11

; recursive process
(define (f-rec n)
  (if (< n 3)
    n
    (+ (f-rec (- n 1))
       (* 2 (f-rec (- n 2)))
       (* 3 (f-rec (- n 3))))))

; iterative process
(define (f n)
  ; Assume n > 3 for now
  (define (iter counter first second third)
    (if (< counter n)
      (iter (+ counter 1)
            (+ first (* 2 second) (* 3 third))
            first
            second)
      first))
  (if (< n 3)
    n
    (iter 2 2 1 0)))

;; Exercise 1.12
(define (pascal row element)
  (if (or (= row 1) (= element 1) (= element row))
    1
    (+ (pascal (- row 1) (- element 1)) (pascal (- row 1) element))))

;; Exercise 1.14
;; Space grows linearly---height of the longest branch of the tree is a + n?
;; Steps grow in both a and n

;; Exercise 1.15
;; 1) p is called five times
;; 2) Space and steps are proportional to \log_3 (a)

;; Exercise 1.16
(define (even? n) (= (remainder n 2) 0))

(define (fast-exp-iter base exponent)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 base exponent))

(fast-exp-iter 2 10)
(fast-exp-iter 3 4)

;; Exercise 1.17
(define (double x) (+ x x))

(define (halve x)
  (define (try guess)
    (if (= (double guess) x)
      guess
      (+ guess (halve (- x (double guess))))))
  (try 1))

(define (mult x y)
  (cond ((= y 1) x)
        ((even? y) (mult (double x) (halve y)))
        (else (+ x (mult x (- y 1))))))

;; Exercise 1.18
(define (peasant-mult x y)
  ;; The invariant quantity is x*y + acc
  (define (iter acc x y)
    (cond ((= y 0) acc)
          ((even? y) (iter acc (double x) (halve y)))
          (else (iter (+ acc x) x (- y 1)))))
  (iter 0 x y))

(peasant-mult 7 9)


;;; Exercise 1.19
;;; T is a linear transformation of the vector [a, b]' and can be represented as
;;; the following matrix:
;;;   [[p+q, q], [q, p]]
;;; Square the matrix and find that:
;;; p-prime = p^2 + p^2
;;; q-prime = q^2 + 2pq
;;; Insert the above into the relevant parts of the provided code

;;; Exercise 1.20
;;; Normal order
;;; Iteration 1
(gcd 206 40)
(if (= 40 0)
  206
  (gcd 40 (remainder 206 40)))

;;; Iteration 2
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0)
  40
  (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;;; 1 remainder calculation
(if (= 6 0)
  40
  (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

;;; Iteration 3
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0)
  (remainder 206 40)
  (gcd (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;;; 2 + 1 = 3 remainder calculations
(if (= 4 0)
  (remainder 206 40)
  (gcd (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

;;; Iteration 4
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
  (remainder 40 (remainder 206 40))
  (gcd
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;;; 4 + 3 = 7 remainder calculations
(if (= 2 0)
  (remainder 40 (remainder 206 40))
  (gcd
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder
       (remainder 40 (remainder 206 40))
       (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;;; Iteration 5
(gcd
   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
   (remainder
     (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(if (= (remainder
         (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
       0)
  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
  (gcd
    (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;;; 7 + 7 = 14 remainder calculations
(if (= 0 0)
  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
  (gcd
    (remainder
      (remainder 40 (remainder 206 40))
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    (remainder
      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
      (remainder
        (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;;; 4 + 14 = 18 remainder calculations
2
;;; This process looks a lot like the Fibonacci sequence


;;; Exercise 1.20
;;; Applicative order

;;; Iteration 1
(gcd 206 40)
(if (= 40 0)
  206
  (gcd 40 (remainder 206 40)))

;;; Iteration 2
(gcd 40 (remainder 206 40))
;;; 1 remainder calculation
(gcd 40 6)
(if (= 6 0)
  40
  (gcd 6 (remainder 40 6)))

;;; Iteration 3
(gcd 6 (remainder 40 6))
;;; 2 remainder calculations
(gcd 6 4)
(if (= 4 0)
  6
  (gcd 4 (remainder 6 4)))

;;; Iteration 4
(gcd 4 (remainder 6 4))
;;; 3 remainder calculations
(gcd 4 2)
(if (= 2 0)
  4
  (gcd 2 (remainder 4 2)))

;;; Iteration 5
(gcd 2 (remainder 4 2))
;;; 4 remainder calculations
(gcd 2 0)
(if (= 0 0)
  2
  (gcd 2 (remainder 2 0)))

2

;;; Exercise 1.21
(define (divides? divisor dividend)
  (= (remainder dividend divisor) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else
          (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(smallest-divisor 199)
;;; 199
(smallest-divisor 1999)
;;; 1999
(smallest-divisor 19999)
;;; 7


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

(search-for-primes (fast-exp-iter 10 11) (+ (fast-exp-iter 10 11) 100))
;;; 100000000003 *** .40000000000009095
;;; 100000000019 *** .40000000000009095
;;; 100000000057 *** .38999999999987267
;;; 100000000063 *** .40000000000009095
;;; 100000000069 *** .41000000000030923
;;; 100000000073 *** .3999999999996362
;;; 100000000091 *** .41000000000030923
;;; ;Unspecified return value

(search-for-primes (fast-exp-iter 10 12) (+ (fast-exp-iter 10 12) 100))
;;; 1000000000039 *** 1.2600000000002183
;;; 1000000000061 *** 1.2899999999999636
;;; 1000000000063 *** 1.2699999999999818
;;; 1000000000091 *** 1.2699999999999818
;;; ;Unspecified return value

(search-for-primes (fast-exp-iter 10 12) (+ (fast-exp-iter 10 12) 100))

;;; Yep, that looks about 3 times as long

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

;;; Go back up and rerun the definitions for smallest-divisor and prime? and
;;; all the definitions under exercise 1.22

(search-for-primes (fast-exp-iter 10 11) (+ (fast-exp-iter 10 11) 100))
;;; 100000000003 *** .23000000000000004
;;; 100000000019 *** .23999999999999994
;;; 100000000057 *** .22999999999999998
;;; 100000000063 *** .2300000000000001
;;; 100000000069 *** .22999999999999998
;;; 100000000073 *** .24
;;; 100000000091 *** .24
;;; ;Unspecified return value

(search-for-primes (fast-exp-iter 10 12) (+ (fast-exp-iter 10 12) 100))
;;; 1000000000039 *** .7399999999999998
;;; 1000000000061 *** .7199999999999998
;;; 1000000000063 *** .7199999999999998
;;; 1000000000091 *** .7200000000000006
;;; ;Unspecified return value

;;; That just a bit slower than twice as fast.  Perhaps there's some overhead
;;; from calling next that we don't get from a builtin like +?

;;; Exercise 1.24
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else false)))

(define (start-prime-test n start-time)
  (if (fast-prime? n)
    (begin
      (newline)
      (display n)
      (report-prime (- (runtime) start-time)))))

;;; Go back up and slime the
(fast-prime? (- (fast-exp-iter 2 31) 1) 10)


;;; Exercise 1.29

;;;
(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (yk k) (f (+ a (* k h))))
    (define (term i) (* (* 2 (+ 1 (remainder i 2))) (yk i)))
    (* (/ h 3) (+ (yk 0) (yk n) (sum term 1 (lambda (x) (+ 1 x)) (- n 1))))))



;;; Exercise 1.30

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

;;; Exercise 1.31
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)
(define (inc x) (+ 1 x))

(define (factorial n)
  (product identity 1 inc n))

(define (pi-product n)
  (define (term i)
    (/ (* 4 i (+ 1 i))
       (square (+ 1 (* 2 i)))))
  (* 4.0 (product term 1 inc n)))

(define (recursive-product term a next b)
  (if (> a b)
    1
    (* (term a) (recursive-product term (next a) next b))))

;;; Exercise 1.32
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (acc-sum term a next b)
  (accumulate + 0 term a next b))

(define (acc-prod term a next b)
  (accumulate * 1 term a next b))

(define (recursive-accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner
      (term a)
      (recursive-accumulate combiner null-value term (next a) b))))

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

;;; Exercise 1.34

(define (f g) (g 2))
(f f)
(f 2)
(2 2)
;;; 2 isn't a procedure, so you get an error when you try to call it.

;;; Exercise 1.35

;;; x = 1 + 1/x
;;; x^2 = x + 1
;;; x^2 - x - 1 = 0
;;; x = (1 +- sqrt(1 - 4*1*(-1))) / 2
;;; x = (1 +- sqrt(5)) / 2
;;; phi = (1 + sqrt(5)) / 2

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display "Guess: ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

;;; Exercise 1.36
(define (average x y) (/ (+ x y) 2))
(define average-damp (lambda (f) (lambda (x) (average x (f x)))))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
;;; 35 iterations
(fixed-point (average-damp (lambda (x) (/ (log 1000) (log x)))) 2.0)
;;; 10 iterations


;;; Exercise 1.37
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

(define (rec-cont-frac n d k)
  (define (recurse i)
    (if (= i k)
      0
      (/ (n i) (+ (d i) (recurse (+ i 1))))))
  (recurse 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

(rec-cont-frac (lambda (i) 1.0)
               (lambda (i) 1.0)
               9)



;;; Exercise 1.38
(+ 2 (cont-frac (lambda (x) 1.0)
                (lambda (x)
                  (if (= (remainder x 3) 2)
                    (* 2 (ceiling (/ x 3)))
                    1))
                100))

;;; Exercise 1.39
(define (tan-cf x k)
  (cont-frac
    (lambda (i) (if (= i 1) x (- (square x))))
    (lambda (i) (- (* i 2.0) 1.0))
    k))

(tan-cf (/ 3.141592 4) 100)


;;; Exercise 1.40
(define dx 0.00001)

(define (deriv f) (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))
(define (newtons-method g guess)
  (define (newton-transform f)
    (lambda (x) (- x (/ (f x) ((deriv f) x)))))
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

;;; (x + 1)(x + 2)(x + 3)
(newtons-method (cubic 6 11 6) 1)

;;; Exercise 1.41

(define (double f) (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
;;; It adds 16.

;;; Exercise 1.42
(define (compose f g) (lambda (x) (f (g x))))

;;; Exercise 1.43
(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

((repeated square 2) 5)

;;; Exercise 1.44
(define (smooth f) (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

;;; Exercise 1.45
