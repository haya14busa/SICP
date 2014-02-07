(define vim-v
  (vertexes->painter
    (list
      (make-vect .06 .86) (make-vect .06 .80) ;;  1 -> 2
      (make-vect .06 .80) (make-vect .13 .80) ;;  2 -> 3
      (make-vect .13 .80) (make-vect .13 .11) ;;  3 -> 4
      (make-vect .13 .11) (make-vect .20 .11) ;;  4 -> 5
      (make-vect .20 .11) (make-vect .95 .80) ;;  5 -> 6
      (make-vect .95 .80) (make-vect .95 .86) ;;  6 -> 7
      (make-vect .95 .86) (make-vect .63 .86) ;;  7 -> 8
      (make-vect .63 .86) (make-vect .63 .80) ;;  8 -> 9
      (make-vect .63 .80) (make-vect .69 .80) ;;  9 -> 10
      (make-vect .69 .80) (make-vect .69 .74) ;; 10 -> 11
      (make-vect .69 .74) (make-vect .33 .43) ;; 11 -> 12
      (make-vect .33 .43) (make-vect .33 .80) ;; 12 -> 13
      (make-vect .33 .80) (make-vect .40 .80) ;; 13 -> 14
      (make-vect .40 .80) (make-vect .40 .86) ;; 14 -> 15
      (make-vect .40 .86) (make-vect .06 .86) ;; 15 -> 1
    )
    #t ))
