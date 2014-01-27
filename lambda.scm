(define square (lambda (x) (* x x)))

(display
  ((lambda (x y z) (+ x y (square z))) 1 2 3)
  )

;; f(x, y) = x(1 + xy)^2 + y(1 - y) + (1 + xy)(1 - y)
;; a = 1 + xy
;; b = 1 - y
(define (f x y)
  (define (f-helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b) ))
  (f-helper
    (+ 1 (* x y))
    (- 1 y)) )

(define (f-let x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)) )
    (+ (* x (square a))
       (* y b)
       (* a b) )))

(define (f-lambda x y)
  ((lambda (a b)
     (+ (* x (square a))
        (* y b)
        (* a b)))
   (+ 1 (* x y)) (- 1 y)))

(newline)
(display (f 3 2))
(newline)
(display (f-let 3 2))
(newline)
(display (f-lambda 3 2))
(newline)

