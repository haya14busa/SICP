(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b)) ))

(display (gcd 124 18))

;; O(log n)steps

