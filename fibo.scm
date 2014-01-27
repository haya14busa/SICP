(define (fibo n)
  (if (< n 1)
      1
      (* n (fibo (- n 1)))))

(define (fibo-no-tail n)
  (if (< n 1)
      1
      (* (fibo-no-tail (- n 1)) n)))

(define (fibo-iter n)
  (define (iter product count)
    (if (> count n)
        product
        (iter (* count product) (+ count 1))))
  (iter 1 1))

; (display (fibo 50))
; (newline)
(display (fibo-iter 100))
(newline)
; (display (fibo-no-tail 50))
; (newline)
