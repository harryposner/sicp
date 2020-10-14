;;; Exercise 1.36

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

(define (average x y) (/ (+ x y) 2))
(define (average-damp f) (lambda (x) (average x (f x))))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
;;; 35 iterations
; Guess: 2.0
; Guess: 9.965784284662087
; Guess: 3.004472209841214
; Guess: 6.279195757507157
; Guess: 3.759850702401539
; Guess: 5.215843784925895
; Guess: 4.182207192401397
; Guess: 4.8277650983445906
; Guess: 4.387593384662677
; Guess: 4.671250085763899
; Guess: 4.481403616895052
; Guess: 4.6053657460929
; Guess: 4.5230849678718865
; Guess: 4.577114682047341
; Guess: 4.541382480151454
; Guess: 4.564903245230833
; Guess: 4.549372679303342
; Guess: 4.559606491913287
; Guess: 4.552853875788271
; Guess: 4.557305529748263
; Guess: 4.554369064436181
; Guess: 4.556305311532999
; Guess: 4.555028263573554
; Guess: 4.555870396702851
; Guess: 4.555315001192079
; Guess: 4.5556812635433275
; Guess: 4.555439715736846
; Guess: 4.555599009998291
; Guess: 4.555493957531389
; Guess: 4.555563237292884
; Guess: 4.555517548417651
; Guess: 4.555547679306398
; Guess: 4.555527808516254
; Guess: 4.555540912917957
; 4.555532270803653
  

(fixed-point (average-damp (lambda (x) (/ (log 1000) (log x)))) 2.0)
;;; 10 iterations
; Guess: 2.0
; Guess: 5.9828921423310435
; Guess: 4.922168721308343
; Guess: 4.628224318195455
; Guess: 4.568346513136242
; Guess: 4.5577305909237005
; Guess: 4.555909809045131
; Guess: 4.555599411610624
; Guess: 4.5555465521473675
; 4.555537551999825
