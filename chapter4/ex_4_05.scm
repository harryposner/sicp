;;; This replaces sequence->exp
(define (expand-cond-actions exprs sym-for-pred)
  (let ((pred (car exprs))
        (actions (cdr exprs))))
  (cond
    ((null? actions)
     actions)
    ((eq? (car actions) '=>)
     (list (cadr actions) sym-for-pred))
    ((last-exp? seq)
     (first-exp seq))
    (else (make-begin seq))))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false     ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (cond-else-clause? first)
            (if (null? rest)
                (expand-cond-actions first #f)
                (error "ELSE clause isn't
                        last: COND->IF"
                       clauses))
            (let ((sym-for-pred (gensym)))
              (list (make-lambda
                      (list sym-for-pred)
                      (make-if sym-for-pred
                               (expand-cond-actions (cond-actions first)
                                                    sym-for-pred)
                               (expand-clauses rest)))
                    (cond-predicate first)))))))
