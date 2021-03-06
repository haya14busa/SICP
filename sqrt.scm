;; (define (sqrt-iter guess x)
;;   (if (good-enough? guess x)
;;       guess
;;       (sqrt-iter (improve guess x) x) ))
;; (define (improve guess x)
;;   (average guess (/ x guess)))
;; (define (average x y)
;;   (/ (+ x y) 2) )
;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.00001))
;; (define (square x) (* x x))
;; (define (sqrt x) (sqrt-iter 1.0 x))

;; Lexical scoping
(define (sqrt x)
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (average x y)
    (/ (+ x y) 2))
  (define (square x) (* x x))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.00001))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x) ))
  (sqrt-iter 1.0 x))

(display (sqrt 2))
(newline)
(display (sqrt 5))
(newline)
(display (sqrt 16))
(newline)
(display (sqrt 100))
(newline)

