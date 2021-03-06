;; (load "init-jakld.lsp")
;; (load "sierpinski.scm")
;; ((sierpinski 3) frm1)
;; (save-picture sierpinski.png")

(define (gasket p0 q0 p1 q1 i)
  (let* ((xm (/ (+ p0 p1) 2.0))
         (ym (+ (* (- p1 p0) 0.866) q0))
         (xs (/ (+ (* 3.0 p0) p1) 4.0))
         (xl (/ (+ (* 3.0 p1) p0) 4.0))
         (ys (+ (* (- p1 p0) 0.433) q0)) )
    (if (= i 0)
        (list (make-vect p0 q0) (make-vect p1 q1)
              (make-vect (/ (+ p0 p1) 2.0) ym)
              (make-vect p0 q0) )
        (append (gasket p0 q0 xm q0 (- i 1))
                (gasket xm q0 p1 q0 (- i 1))
                (list (make-vect p0 q0))
                (gasket xs ys xl ys (- i 1))
                (list (make-vect p0 q0)) ))))

(define (sierpinski n)
  (vects->painter (gasket 0.0 0.0 1.0 0.0 n)))

(define (vects->painter vects)
    (define (vects->painter-iter vects)
    (if (eq? 2 (length vects))
        (list (make-segment (car vects) (cadr vects)))
        (cons (make-segment (car vects) (cadr vects))
              (vects->painter-iter (cdr vects)))))
    (segments->painter (vects->painter-iter vects)))
