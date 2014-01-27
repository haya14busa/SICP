(define (factorial n)
  (if (< n 1)
      1
      (* n (factorial (- n 1)))))

(define (factorial-no-tail n)
  (if (< n 1)
      1
      (* (factorial-no-tail (- n 1)) n)))

(define (factorial-iter n)
  (define (iter product count)
    (if (> count n)
        product
        (iter (* count product) (+ count 1))))
  (iter 1 1))

; (display (factorial 50))
; (newline)
(display (factorial-iter 100))
(newline)
; (display (factorial-no-tail 50))
; (newline)
