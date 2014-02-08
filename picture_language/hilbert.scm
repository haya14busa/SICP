;; (load "init-jakld.lsp")
;; (load "hilbert.scm")
;; ((hilbert 3) frm1)
;; (save-picture "hilbert.png")

(define (hilbert n) (vects->painter (hilbert-a 0 0 1 1 n)))

(define (vects->painter vects)
    (define (vects->painter-iter vects)
    (if (eq? 2 (length vects))
        (list (make-segment (car vects) (cadr vects)))
        (cons (make-segment (car vects) (cadr vects))
              (vects->painter-iter (cdr vects)))))
    (segments->painter (vects->painter-iter vects)))

(define (hilbert-a p0 q0 p1 q1 i)
    (let ((xs (/ (+ (* 3.0 p0) p1) 4.0))
          (ys (/ (+ (* 3.0 q0) q1) 4.0))
          (xm (/ (+ p0 p1) 2.0))
          (ym (/ (+ q0 q1) 2.0))
          (xl (/ (+ p0 (* 3.0 p1)) 4.0))
          (yl (/ (+ q0 (* 3.0 q1)) 4.0)))
    (if (= i 0)
        (list (make-vect xl yl) (make-vect xs yl)
              (make-vect xs ys) (make-vect xl ys))
        (append (hilbert-d xm ym p1 q1 (- i 1))
                (hilbert-a p0 ym xm q1 (- i 1))
                (hilbert-a p0 q0 xm ym (- i 1))
                (hilbert-b xm q0 p1 ym (- i 1))))))

(define (hilbert-b p0 q0 p1 q1 i)
    (let ((xs (/ (+ (* 3.0 p0) p1) 4.0))
          (ys (/ (+ (* 3.0 q0) q1) 4.0))
          (xm (/ (+ p0 p1) 2.0))
          (ym (/ (+ q0 q1) 2.0))
          (xl (/ (+ p0 (* 3.0 p1)) 4.0))
          (yl (/ (+ q0 (* 3.0 q1)) 4.0)) )
    (if (= i 0)
        (list (make-vect xs ys) (make-vect xs yl)
              (make-vect xl yl) (make-vect xl ys) )
        (append (hilbert-c p0 q0 xm ym (- i 1))
                (hilbert-b p0 ym xm q1 (- i 1))
                (hilbert-b xm ym p1 q1 (- i 1))
                (hilbert-a xm q0 p1 ym (- i 1)) ))))
(define (hilbert-c p0 q0 p1 q1 i)
    (let ((xs (/ (+ (* 3.0 p0) p1) 4.0))
          (ys (/ (+ (* 3.0 q0) q1) 4.0))
          (xm (/ (+ p0 p1) 2.0))
          (ym (/ (+ q0 q1) 2.0))
          (xl (/ (+ p0 (* 3.0 p1)) 4.0))
          (yl (/ (+ q0 (* 3.0 q1)) 4.0)) )
    (if (= i 0)
    (list (make-vect xs ys) (make-vect xl ys)
          (make-vect xl yl) (make-vect xs yl) )
    (append (hilbert-b p0 q0 xm ym (- i 1))
            (hilbert-c xm q0 p1 ym (- i 1))
            (hilbert-c xm ym p1 q1 (- i 1))
            (hilbert-d p0 ym xm q1 (- i 1)) ))))
(define (hilbert-d p0 q0 p1 q1 i)
    (let ((xs (/ (+ (* 3.0 p0) p1) 4.0))
          (ys (/ (+ (* 3.0 q0) q1) 4.0))
          (xm (/ (+ p0 p1) 2.0))
          (ym (/ (+ q0 q1) 2.0))
          (xl (/ (+ p0 (* 3.0 p1)) 4.0))
          (yl (/ (+ q0 (* 3.0 q1)) 4.0)) )
    (if (= i 0)
        (list (make-vect xl yl) (make-vect xl ys)
            (make-vect xs ys) (make-vect xs yl) )
        (append (hilbert-a xm ym p1 q1 (- i 1))
                (hilbert-d xm q0 p1 ym (- i 1))
                (hilbert-d p0 q0 xm ym (- i 1))
                (hilbert-c p0 ym xm q1 (- i 1)) ))))
