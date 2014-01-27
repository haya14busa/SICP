(define (move-tower size from to extra)
  (cond ((= size 0) #t)
        (else
          (move-tower (- size 1) from extra to)
          (print-move from to)
          (move-tower (- size 1) extra to from)) ))

(define (print-move from to)
  (newline)
  (display "move top disk from ")
  (display from)
  (display " to ") (display to))

(define (solve-tower-of-hanoi size from to)
  (move-tower size from to (- 6 from to)) )

(solve-tower-of-hanoi 5 1 2)
