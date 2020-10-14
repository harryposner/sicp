;;; Exercise 2.23

;;; If the return value is really arbitrary, you could just. . .
(define for-each map)

;;; But if we need an implementation:
(define (for-each fn lst)
  (if (null? lst)
    #t
    (begin
      (fn (car lst))
      (for-each fn (cdr lst)))))
