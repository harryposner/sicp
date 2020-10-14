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
