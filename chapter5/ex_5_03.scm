;;; Exercise 5.3

;;; Using high-level primitives
(controller
  (assign x (op read))
  (assign g (const 1.0))
  test-good-enough
  (test (op good-enough?) (reg x) (reg g))
  (branch (label sqrt-done))
  (assign g (op improve) (reg x) (reg g))
  (goto (label test-good-enough))
  sqrt-done)

;;; Using arithmetic primitives
(controller
  (assign x (op read))
  (assign g (const 1.0))
  test-good-enough
  (assign t (op mul (reg g) (reg g)))
  (assign t (op sub (reg t) (reg x)))
  (test (op <) (const 0) (reg t))
  (branch (label abs-done))
  (assign t (op sub (const 0) (reg t)))
  abs-done
  ; Register t now holds (abs (- (square guess) x))
  (test (op <) (reg t) (const 0.001))
  (branch (label sqrt-done))
  ; Improving guess
  (assign t (op div (reg x) (reg g)))
  (assign t (op add (reg g) (reg t)))
  (assign t (op div (reg t) (const 2)))
  (assign g (reg t))
  (goto (label test-good-enough))
  sqrt-done)
