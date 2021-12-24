;;; Exercise 2.31

(define (tree-map fn tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (tree-map fn sub-tree)
           (fn sub-tree)))
       tree))
