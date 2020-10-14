;;; Exercise 2.17

(define (last-pair ls)
  (let ((next (cdr ls)))
    (if (null? next)
      ls
      (last-pair next))))
