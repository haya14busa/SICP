(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b)) ))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b)) ))

(define (inc n) (+ n 1))
(define (cube x) (* x x x))

(define (sum-cubes a)
  (sum cube 1 inc a))

; (display (product sum-cubes 1 inc 5))

(define (accumulate combiner null-value
                    term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value
                            term (next a) next b))))

(define (accu-sum term a next b)
  (accumulate + 0 term a next b))
(define (accu-pro term a next b)
  (accumulate * 1 term a next b))

(define (pro-cube n)
  (accu-pro (lambda (x) (* x x x)) 1
            (lambda (x) (+ x 1)) n))
(display (pro-cube 3))
;; 1^3 * 2^3 * 3^3
