(define (fibo n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fibo (- n 1))
                 (fibo (- n 2)) ))))

;; Linear Iterative Process
(define (fibo-iter n)
  (define (iter a b count)
    (if (= count 0)
        a
        (iter b (+ a b) (- count 1)) ))
  (iter 0 1 n) )


(display (fibo 15))
(newline)
(display (fibo-iter 15))

; if n >= 2
; C(n) = C(n-1) + C(n-2) + 1
