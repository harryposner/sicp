;;; Exercise 2.29

;;; Part 1
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

;;; Part 2
(define (struct-weight struct)
  (if (number? struct)
    struct
    (total-weight struct)))
(define (total-weight mobile)
  (let ((left-struct (branch-structure (left-branch mobile)))
        (right-struct (branch-structure (right-branch mobile))))
    (+ (struct-weight left-struct)
       (struct-weight right-struct))))

;;; Part 3
(define (branch-torque branch)
  (* (branch-length branch) (total-weight branch)))
(define (balanced? mobile)
  (= (branch-torque (left-branch mobile))
     (branch-torque (right-branch mobile))))

;;; Part 4
;;; I have to change the selectors left-branch, right-branch, branch-length,
;;; and branch-structure.  Since total-weight and balanced? are defined in
;;; terms of the selectors, I don't need to change them.
