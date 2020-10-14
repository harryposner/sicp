;;; Exercise 1.34

(define (f g) (g 2))
;;; Solve by substitution:
(f f)
(f 2)
(2 2)
;;; 2 isn't a procedure, so you get an error when you try to call it.
