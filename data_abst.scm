;; Rational Number

;; Constracter  : (make-rat <n> <d>)
;; Selecter     : (numer <x>) (denom <x>)
;; Predicate    : (rational? <x>) (equal-rat? <x> <y>)
;; Input/Output : (print-rat <x>)

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)) )
            (* (denom x) (denom y)) ))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)) )
            (* (denom x) (denom y)) ))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y)) ))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y)) ))

; (define (make-rat n d) (cons n d))

(define (make-rat n d)
    (define (gcd a b)
        (if (= b 0)
            a
            (gcd b (remainder a b)) ))
    (if (= d 0) (error "zerro division")
        (let ((g (gcd n d)))
        (cons (/ n g) (/ d g)) )))

(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x))
  x )

(define a (make-rat 1 2))
(define b (make-rat 1 3))

(print-rat (add-rat a b))
(print-rat (sub-rat a b))
(print-rat (mul-rat a b))
(print-rat (div-rat a b))
