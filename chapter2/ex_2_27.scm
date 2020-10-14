;;; Exercise 2.27

(define (deep-reverse lst)
  (map
    (lambda (element)
      (if (list? element)
        (if (any list? element)
          (deep-reverse element)
          (reverse element))
        element))
    (reverse lst)))

(deep-reverse '((1 2) (3 4)))
(deep-reverse '(0 (1 2) (3 (4 5) 6) 7 (8 (9 (10)))))
