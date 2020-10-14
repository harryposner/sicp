; Exercise 1.11

;;; We can represent this as a difference equation.  Let v(n) be the vector of
;;; [f(n), f(n-1), f(n-2)]'.  Then v(n) = T v(n-1), where:
;;; T = [[1, 2, 3],
;;;      [1, 0, 0],
;;;      [0, 1, 0]]

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
