(define-syntax and
  (syntax-rules ()
    ((and)
     #t)
    ((and expr)
     expr)
    ((and expr rest ...)
     (let ((result expr))
       (if result
           (and rest ...)
           result)))))

(define (and->if expr)
  (let helper ((remaining-exprs (rest-exps expr)))
    (if (null? remaining-exprs)
        'true
        ;;; Simulating let so we don't evaluate the conditions twice.  It also
        ;;; guarantees left-to-right order of evaluation by applicative order
        ;;; evaluation (see ex. 4.1).
        (let ((sym-for-condition (gensym)))
          (list (make-lambda (list sym-for-condition)
                             (make-if sym-for-condition
                                      (helper (rest-exps remaining-exprs))
                                      sym-for-condition))
                (first-exp remaining-exprs))))))

(define (or->if expr)
  (let helper ((remaining-exprs (rest-exps expr)))
    (if (null? remaining-exprs)
        'false
        (let ((sym-for-condition (gensym)))
          (list (make-lambda (list sym-for-condition)
                             (make-if sym-for-condition
                                      sym-for-condition
                                      (helper (rest-exps remaining-exprs))))
                (first-exp remaining-exprs))))))
