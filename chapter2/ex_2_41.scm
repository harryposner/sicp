;;; Exercise 2.41

(define (ordered-distinct-tuples n ubound)
  (cond
    ((zero? n) '())
    ((= n 1) (map list (iota ubound 1)))
    (else (flatmap (lambda (tuple)
                     (map (lambda (i)
                            (cons i tuple))
                          (iota (sub1 (car tuple)) 1)))
                   (ordered-distinct-tuples (sub1 n) ubound)))))

(define (triples-summing-to n s)
  (filter (lambda (triple) (= s (fold-left + 0 triple)))
          (ordered-distinct-tuples 3 n)))
