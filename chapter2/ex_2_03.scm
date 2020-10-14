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
