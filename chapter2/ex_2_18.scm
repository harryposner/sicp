;;;Exercise 2.18

(define (reverse ls)
  (define (iter forward backward)
    (if (null? forward)
      backward
      (iter (cdr forward) (cons (car forward) backward))))
  (iter ls (list)))
