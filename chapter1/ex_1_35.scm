;;; Exercise 1.35

;;; x = 1 + 1/x
;;; x^2 = x + 1
;;; x^2 - x - 1 = 0
;;; x = (1 +- sqrt(1 - 4*1*(-1))) / 2
;;; x = (1 +- sqrt(5)) / 2
;;; phi = (1 + sqrt(5)) / 2


(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

;;; Using the modified version of fixed-point from Exercise 1.36:
; Guess: 1.0
; Guess: 2.0
; Guess: 1.5
; Guess: 1.6666666666666665
; Guess: 1.6
; Guess: 1.625
; Guess: 1.6153846153846154
; Guess: 1.619047619047619
; Guess: 1.6176470588235294
; Guess: 1.6181818181818182
; Guess: 1.6179775280898876
; Guess: 1.6180555555555556
; Guess: 1.6180257510729614
; Guess: 1.6180371352785146
; 1.6180327868852458
