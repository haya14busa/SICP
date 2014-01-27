(define (prime? n)
  (if (even? n)
      #f
      (= n (smallest-divisor n)) ))

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n)
           test-divisor )
          (else (find-divisor n
                    (+ test-divisor 2) )) ))
  (define (divides? a b)
    (= (remainder b a) 0))
  (find-divisor n 3))

(define (square x) (* x x))

(display (prime? 5))
(newline)
(display (prime? 6))
(newline)
(display (prime? 15))
(newline)
(display (prime? 2))
(newline)
(display (prime? 1993))
