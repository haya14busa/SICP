(define (jmc n)
  (if (> n 100)
      (- n 10)
      (jmc (jmc (+ n 11)))))

; (display
;     (jmc (remainder 60024 100))
;     )

; (define dx 0.0001)
; (define (ddx f x)
;   (let (dx 0.0001)
;     ( (/ (- (f (+ x dx)) (f x)) dx)) ))

(define (deriv f)
  (let ((dx 0.0001))
    (lambda (x)
        (/ (- (f (+ x dx)) (f x)) dx))) )

(display ((deriv (lambda (x) (* x x))) 3))

(define (compose f g)
  (lambda (x)
    (f (g x)) ))

