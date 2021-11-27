(define (an-integer-between low high)
  (if (<= low high)
      (amb low (an-integer-between (add1 low) high))
      (amb)))
