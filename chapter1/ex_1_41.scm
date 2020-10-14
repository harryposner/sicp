;;; Exercise 1.41

(define (double f) (lambda (x) (f (f x))))

(((double (double double)) inc) 5)

;;; It adds 16.  The (double double) expression returns a function that applies
;;; double twice, so it will apply its argument four times.  Applying double to
;;; that function returns a function that calls (four-times (four-times x)), so
;;; it applies its argument 16 times.
