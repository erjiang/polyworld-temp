(define Ne 800)
(define Ni 200)
(define re (map (lambda (_) (random 1.0))
                (make-list Ne)))
(define ri (map (lambda (_) (random 1.0))
                (make-list Ni)))

(define a (append (make-list Ne 0.02)
                  (map (lambda (i)
                         (+ 0.02 (* 0.08 i)))
                       ri)))
(define b (append (make-list Ne 0.2)
                  (map (lambda (i)
                         (- 0.25 (* 0.05 i)))
                       ri)))

(define c (append (map (lambda (i)
                         (+ -65 (* 15 (expt i 2))))
                       re)
                  (make-list Ni -65)))

(define d (append (map (lambda (i)
                         (- 8 (* 6 (expt i 2))))
                       re)
                  (make-list Ni 2)))

(define a 0.02)
(define b 0.2)
(define c -65)
(define d 2)
;;(define S (append (map (lambda (_)
;;                         (* 0.5 
;;
(define (izhikevich u v I)
  (let ((step (lambda (u v I)
                (+ v (* 0.5 (+ (* 0.04 (expt v 2))
                               (* 5 v)
                               140
                               (- u)
                               I))))))
    (cons (step u (step u v I) I)
          (+ u (* a (- (* b v) u))))))