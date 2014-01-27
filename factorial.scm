;; Linear Recursion and Iteration
(define (factorial n)
  (if (< n 1)
      1
      (* n (factorial (- n 1)))))

;; Linear Recursion
;; (factorial 5)
;; (* 5 (factorial 4))
;; (* 5 (* 4 (factorial 3)))
;; (* 5 (* 4 (* 3 (factorial 2))))
;; (* 5 (* 4 (* 3 (* 2 (factorial 1)))))
;; (* 5 (* 4 (* 3 (* 2 (* 1 (factorial 0))))))   ----> space complexity
;; (* 5 (* 4 (* 3 (* 2 (* 1 1)))))                     n for n!
;; (* 5 (* 4 (* 3 (* 2 1))))                           the number of '*'
;; (* 5 (* 4 (* 3 2)))
;; (* 5 (* 4 6))
;; (* 5 24)
;; 120
;;
;;
;; ↓
;; time complexity
;; n for n!
;; the number of 'factorial'


(define (factorial-no-tail n)
  (if (< n 1)
      1
      (* (factorial-no-tail (- n 1)) n)))

;; Linear Iteration
(define (factorial-iter n)
  ;; information hiding
  (define (iter product count)
    (if (> count n)
        product
        (iter (* count product) (+ count 1))))
  (iter 1 1))

;; (factorial-iter 5)
;; (iter 1   1)
;; (iter 1   2)
;; (iter 2   3)
;; (iter 6   4)
;; (iter 24  5)
;; (iter 120 6)
;; 120

; (display (factorial 50))
; (newline)
(display (factorial-iter 100))
(newline)
; (display (factorial-no-tail 50))
; (newline)
