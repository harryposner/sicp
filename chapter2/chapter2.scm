;;; Exercise 2.1

(define (make-rat n d)
  (let ((g
          (if (< d 0)
            (- (gcd n d))
            (gcd n d))))
    (cons (/ n g)
          (/ d g))))

(make-rat 1 2)
(make-rat -1 2)
(make-rat 1 -2)
(make-rat -1 -2)


;;; Exercise 2.2

(define (make-segment start end)
  (cons start end))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (make-point
      (average (x-point start) (x-point end))
      (average (y-point start) (y-point end)))))

;;; Exercise 2.3

(define (length-segment segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (sqrt (+ (square (- (x-point start) (x-point end)))
             (square (- (y-point start) (y-point end)))))))

(define (make-rectangle base-segment height)
  (cons base-segment height))
(define (base-rect rectangle)
  (length-segment (car rectangle)))
(define (height-rect rectangle)
  (cdr rectangle))

(define (area-rect rectangle)
  (* (base-rect rectangle) (height-rect rectangle)))
(define (perim-rect rectangle)
  (+ (* 2 (base-rect rectangle)) (* 2 (height-rect rectangle))))

(perim-rect (make-rectangle (make-segment (make-point 0 0) (make-point 3 0)) 4))
(area-rect (make-rectangle (make-segment (make-point 0 0) (make-point 3 0)) 4))

(define (make-rectangle diag-segment theta)
  ;;; Theta is one of the vertical angles formed by the diagonals
  (cons diag-segment theta))
(define (base-rect rectangle)
  (* (cos (/ (cdr rectangle) 2)) (length-segment (car rectangle))))
(define (height-rect rectangle)
  (* (sin (/ (cdr rectangle) 2)) (length-segment (car rectangle))))

(perim-rect (make-rectangle
              (make-segment (make-point 0 0) (make-point 3 4))
              (* 2 (asin (/ 4 5)))))
(area-rect (make-rectangle
             (make-segment (make-point 0 0) (make-point 3 4))
             (* 2 (asin (/ 4 5)))))


;;; Exercise 2.4
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

;;; Exercise 2.5
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (get-element int-pair base count)
  (if (= 0 (remainder int-pair base))
    (get-element (/ int-pair base) base (+ count 1))
    count))
(define (car int-pair)
  (get-element int-pair 2 0))
(define (cdr int-pair)
  (get-element int-pair 3 0))


;;; Exercise 2.6
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))


;;; Exercise 2.7
(define (make-interval a b) 
  (if (<= a b)
      (cons a b)
      (error "Upper bound less than lower bound: MAKE-INTERVAL" a b)))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

;;; Exercise 2.8
(define (sub-interval a b)
  (make-interval
    (- (lower-bound a) (upper-bound b))
    (- (upper-bound a) (lower-bound b))))

;;; Exercise 2.9
(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2))

;;; Exercise 2.10
(define (div-interval x y)
  (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
    (error "Divisor interval spans zero")
    (mul-interval x
                  (make-interval
                    (/ (upper-bound y))
                    (/ (lower-bound y))))))

;;; Exercise 2.11
(define (mul-interval x y)
  (let ((x-min (lower-bound x))
        (x-max (upper-bound x))
        (y-min (lower-bound y))
        (y-max (upper-bound y)))
    (cond
      ;;; Both intervals have the same sign
      ((and (> x-min 0) (> y-min 0))
       (make-interval (* x-min y-min) (* x-max y-max)))
      ((and (< x-max 0) (< y-max 0))
       (make-interval (* x-max y-max) (* x-min y-min)))
      ;;; Intervals have opposite signs
      ((and (< x-max 0) (> y-min 0))
       (make-interval (* x-min y-max) (* x-max y-min)))
      ((and (> x-min 0) (< y-max 0))
       (make-interval (* x-max y-min) (* x-min y-max)))
      ;;; Lesser interval spans zero and greater interval is positive
      ((and (<= x-min 0) (>= x-max 0) (> y-min 0))
       (make-interval (* x-min y-max) (* x-max y-max)))
      ((and (<= y-min 0) (>= y-max 0) (> x-min 0))
       (make-interval (* x-max y-min) (* x-max y-max)))
      ;;; Greater interval spans zero and lesser interval is negative
      ((and (<= x-min 0) (>= x-max 0) (< y-max 0))
       (make-interval (* x-max y-min) (* x-min y-min)))
      ((and (<= y-min 0) (>= y-max 0) (< x-max 0))
       (make-interval (* x-min y-max) (* x-min y-min)))
      ;;; Both intervals span zero
      ((and (<= x-min 0) (>= x-max 0) (<= y-min 0) (>= y-max 0))
       (make-interval
         (min (* x-min y-max) (* x-max y-min))
         (max (* x-max y-max) (* x-min y-min)))))))

(mul-interval (make-interval 0 0) (make-interval 1 1))

;;; Exercise 2.12

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (make-center-percent center percent-tol)
  (let ((half-width (* center (/ percent-tol 100.0))))
    (make-interval (- center half-width) (+ center half-width))))
(define (percent interval)
  (* 100.0  (/ (width interval) (center interval))))

(percent (make-center-percent 100 10))

;;; Exercise 2.13

;;; With two positive intervals, the lower bound of the product is the product
;;; of the lower bounds of the factors, and the upper bound of the product is
;;; the product of the upper bounds of the factors.  Let the two intervals have
;;; centers Cx and Cy and widths (not percent widths) Wx and Wy.

;;; The lower bound is:
;;;   (Cx - Wx)(Cy - Wy) = CxCy - CxWy - CyWx + WxWy
;;; The upper bound is:
;;;   (Cx + Wx)(Cy + Wy) = CxCy + CxWy + CyWx + WxWy
;;; The center is the midpoint between the two bounds:
;;;   (CxCy - CxWy - CyWx + WxWy + CxCy + CxWy + CyWx + WxWy) / 2
;;;     = CxCy + WxWy
;;; The percent tolerance is both (UB/Ctr - 1) and (1 - LB/Ctr).
;;;   (UB/Ctr - 1) = (CxCy + CxWy +CyWx + WxWy) / (CxCy + WxWy) - 1
;;;   (1 - LB/Ctr) = 1 - (CxCy - CxWy - CyWx + WxWy) / (CxCy + WxWy)
;;; In terms of percent tolerances Px = Wx/Cx and Py = Wy/Cy:
;;;   (UB/Ctr - 1) = (CxCy + CxCyPy + CxCyPx + CxCyPxPy) / (CxCy + CxCyPxPy) - 1
;;;                = (1 + Py + Px + PxPy) / (1 + PxPy) - 1
;;;                = (1 + Py + Px + PxPy - (1 + PxPy)) / (1 + PxPy)
;;;                = (Py + Px) / (1 + PxPy)
;;;   (1 - LB/Ctr) = 1 - (CxCy - CxCyPy - CxCyPx + CxCyPxPy) / (CxCy + CxCyPxPy)
;;;                = 1 - (1 - Py - Px + PxPy) / (1 + PxPy)
;;;                = (1 + PxPy - (1 - Py - Px + PxPy)) / (1 + PxPy)
;;;                = (Py + Px) / (1 + PxPy)

;;; Approximation given small deviations screams for a Taylor expansion.  The
;;; problem says "simple," so we'll do a first-order approximation.  It makes
;;; sense to center the approximation around (0, 0) since Px and Py are near
;;; zero by construction.  Let G(Px, Py) be the percentage deviation of the
;;; product interval.  Take the partial derivatives:
;;;   dG/dPx = (1 + PxPy) - Py(Py + Px)
;;;          = 1 + PxPy - Py^2 + PxPy
;;;          = 2PxPy + 1 - Py^2
;;;   dG/dPy = 2PxPy + 1 - Px^2
;;; The Taylor approximation T is:
;;;   T(Px, Py) = G(0, 0) + Px(dG/dPx(0, 0)) + Py(dG/dPy(0, 0))
;;;             = Px + Py

;;; Exercise 2.14
(define (add-interval a b)
  (make-interval
    (+ (lower-bound a) (lower-bound b))
    (+ (upper-bound a) (upper-bound b))))

(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))

(par1 (make-center-percent 3.5 4.3) (make-center-percent 3.5 4.3))
;;;
(par2 (make-center-percent 3.5 4.3) (make-center-percent 3.5 4.3))

(define r1 (make-center-percent 10.0 1.0))

(let ((one (make-interval 1 1)))
  (div-interval
   one
   (add-interval
    (div-interval one r1)
    (div-interval one r1))))


;;; Exercise 2.17
(define one-through-four (list 1 2 3 4))

(define (last-pair ls)
  (let ((next (cdr ls)))
    (if (null? next)
      ls
      (last-pair next))))

(last-pair one-through-four)

;;;Exercise 2.18
(define (reverse ls)
  (define (iter forward backward)
    (if (null? forward)
      backward
      (iter (cdr forward) (cons (car forward) backward))))
  (iter ls (list)))

(reverse one-through-four)

;;; Exercise 2.19
(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

;;; By construction of the problem, order can't matter.

;;; Exercise 2.20
(define (filter predicate? ls)
  (cond ((null? ls)
         ls)
        ((predicate? (car ls))
         (cons (car ls) (filter predicate? (cdr ls))))
        (else (filter predicate? (cdr ls)))))

(define (same-parity first . rest)
  (cons
    first
    (filter (lambda (x) (= (remainder x 2) (remainder first 2))) rest)))


;;; Exercise 2.21
(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map square items))


;;; Exercise 2.22

;;; The first method gives a reversed list because it naively cdrs down the
;;; input list and conses up the output list.  Each step takes the head of the
;;; old list and puts it at the head of the new list, so once you've cdred down
;;; to the end of the old list, you've put the last element of the old list at
;;; the head of the new list.

;;; The second method doesn't work because cons doesn't append to a list; it
;;; only prepends.


;;; Exercise 2.23
;;; If the return value is really arbitrary, you could just. . .
(define for-each map)
;;; But if we need an implementation:
(define (for-each fn lst)
  (if (null? lst)
    #t
    (begin
      (fn (car lst))
      (for-each fn (cdr lst)))))

;;; Exercise 2.24
(list 1 (list 2 (list 3 4)))
;;; (1 (2 (3 4)))

;;; |---|---|  |---|\--|
;;; |   |   -->|   | \ |
;;; |-|-|---|  |-|-|--\|
;;;   |          |
;;;   V          V
;;;   1        |---|---|  |---|\--|
;;;            |   |   -->|   | \ |
;;;            |-|-|---|  |-|-|--\|
;;;              |          |
;;;              V          V
;;;              2        |---|---|  |---|\--|
;;;                       |   |   -->|   | \ |
;;;                       |-|-|---|  |-|-|--\|
;;;                         |          |
;;;                         V          V
;;;                         3          4

;;;  /\
;;; 1 /\
;;;  2 /\
;;;   3 4


;;; Exercise 2.25

;;; cadaddr isn't defined by default
(car (cdr (car (cdr (cdr '(1 3 (5 7) 9))))))

(caar '((7)))

(car
  (cdr
    (car
      (cdr
        (car
          (cdr
            (car
              (cdr
                (car
                  (cdr
                    (car
                      (cdr
                        '(1 (2 (3 (4 (5 (6 7))))))))))))))))))


;;; Exercise 2.26

;;; (append x y)
(1 2 3 4 5 6)
;;; (cons x y)
((1 2 3) 4 5 6)
;;; (list x y)
((1 2 3) (4 5 6))



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


;;; Exercise 2.28
(define (fringe tree)
  (define (iter down up)
    (cond
      ((null? down) up)
      ((list? (car down))
       (iter (cdr down) (iter (car down) up)))
      (else (iter (cdr down) (append up (list (car down)))))))
  (iter tree '()))

(fringe '((1 2) (3 4)))
(fringe '(0 (1 2) (3 (4 5) 6) 7 (8 (9 (10)))))


;;; Exercise 2.29

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

(define (struct-weight struct)
  (if (number? struct)
    struct
    (total-weight struct)))
(define (total-weight mobile)
  (let ((left-struct (branch-structure (left-branch mobile)))
        (right-struct (branch-structure (right-branch mobile))))
    (+ (struct-weight left-struct)
       (struct-weight right-struct))))

(define (branch-torque branch)
  (* (branch-length branch) (total-weight branch)))
(define (balanced? mobile)
  (= (branch-torque (left-branch mobile))
     (branch-torque (right-branch mobile))))

;;; I have to change the selectors left-branch, right-branch, branch-length,
;;; and branch-structure.  Since total-weight and balanced? are defined in
;;; terms of the selectors, I don't need to change them.



;;; Exercise 2.30

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (square sub-tree)))
       tree))

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

;;; Exercise 2.31
(define (tree-map fn tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (tree-map fn sub-tree)
           (fn sub-tree)))
       tree))


;;; Exercise 2.32

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest
              (map (lambda (el) (cons (car s) el))
                   rest)))))

(subsets '(1 2 3))


;;; Excercise 2.33
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))


;;; Exercise 2.34
(define (horner-eval x coefficient-sequence)
  (accumulate
    (lambda (this-coeff higher-terms)
      (+ this-coeff (* x higher-terms)))
    0
    coefficient-sequence))
(horner-eval 2 '(1 3 0 5 0 1))

;;; Exercise 2.35
(define (count-leaves t)
  (accumulate
    +
    0
    (map (lambda (x) 1)
         (fringe t))))

;;; Exercise 2.36

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))

;;; Exercise 2.37
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (r)
           (map (lambda (c) (dot-product r c))
                cols))
         m)))

;;; Exercise 2.38

;;; You need associativity and commutativity, right?


;;; Exercise 2.39
(define (reverse sequence)
  (fold-right
    (lambda (x y) (append y (list x)))
    '()
    sequence))

(define (reverse sequence)
  (fold-left
    (lambda (x y) (cons y x))
    '()
    sequence))


;;; Exercise 2.40
(define (unique-pairs n)
  (flatmap (lambda (i)
         (map (lambda (j) (list j i))
              (iota (- i 1) 1)))
       (iota (- n 1) 2)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

;;; Exercise 2.41
