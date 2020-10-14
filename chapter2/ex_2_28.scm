;;; Exercise 2.28

(define (fringe tree)
  (define (iter down up)
    (cond
      ((null? down) up)
      ((list? (car down))
       ;;; Ok, this step isn't a tail call, so `iter` is a misnomer
       (iter (cdr down) (iter (car down) up)))
      (else (iter (cdr down) (append up (list (car down)))))))
  (iter tree '()))

(fringe '((1 2) (3 4)))
(fringe '(0 (1 2) (3 (4 5) 6) 7 (8 (9 (10)))))

