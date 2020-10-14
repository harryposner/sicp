;;; Exercise 4.1

;;; This solution relies on applicative-order evaluation.  Applicative order
;;; means that we evaluate the arguments of a procedure before evaluating
;;; the body.  If we break the evaluation of cons so its arguments are
;;; evaluated in two separate procedure applications, we can control the order
;;; in which the arguments of cons are evaluated.  

;;; See section 2.1 of
;;; Steele and Sussman, 1975, "Lambda: the Ultimate Imperative". 
;;; http://hdl.handle.net/1721.1/5790

;;; Left-to-right
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    ((lambda (first-op)
       (cons first-op
             (list-of-values (rest-operands exps) env)))
     (eval (first-operand exps) env))))

;;; Right-to-left
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    ((lambda (rest-ops)
       (cons (eval (first-operand exps) env)
             rest-ops))
     (list-of-values (rest-operands exps) env))))
