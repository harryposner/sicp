;;; Exercise 1.40

;;; Definitions from the book:
(define dx 0.00001)

(define (deriv f) (lambda (x) (/ (- (f (+ x dx)) (f x)) dx)))

(define (newtons-method g guess)
  (define (newton-transform f)
    (lambda (x) (- x (/ (f x) ((deriv f) x)))))
  (fixed-point (newton-transform g) guess))


(define (cubic a b c)
  (lambda (x) (+ (expt x 3) (* a (expt x 2)) (* b x) c)))

;;; (x + 1)(x + 2)(x + 3)
(newtons-method (cubic 6 11 6) 1)
; -0.9999999999359223

(newtons-method (cubic 6 11 6) -1.6)
; -2.0000000000000027

(newtons-method (cubic 6 11 6) -5)
; -2.999999999967476
