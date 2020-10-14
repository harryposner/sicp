;;; Exercise 2.25

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
