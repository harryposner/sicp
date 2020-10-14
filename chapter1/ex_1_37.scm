;;; Exercise 1.37

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))


(define (rec-cont-frac n d k)
  (/ (n 1)
     (+ (d 1)
        (if (= k 0)
            0
            (rec-cont-frac (lambda (i) (n (inc i)))
                           (lambda (i) (d (inc i)))
                           (dec k))))))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
; 0.6179775280898876

(rec-cont-frac (lambda (i) 1.0)
               (lambda (i) 1.0)
               9)
; 0.6179775280898876
