;;; Exercise 4.2

;;; The problem with putting procedure applications before assignments,
;;; definitions, etc. in the metacircular evaluator is that the "application?"
;;; predicate as written in the book doesn't check whether an expression is a
;;; special form.  Instead, it relies on the fact that the evaluator will check
;;; for special forms before it considers whether the expression might be a
;;; procedure application.  So it will interpret (define x 3) as a call to the
;;; procedure named "define" with x and 3 as its arguments.

(define (application? exp)
  (and (pair? exp)
       (tagged-list? exp 'call)))

(define (operator exp)
  (cadr exp))

(define (operands exp)
  (cddr exp))
