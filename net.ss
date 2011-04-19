;; Scheme version of nettest.m

(define a 0.02)
(define b 0.2)
(define c -65)
(define d 2)
(define v -65)
(define u (* b v))
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
    (let ((newv (step u (step u v I) I)))
      (cons newv
            (+ u (* a (- (* b newv) u)))))))

(define test
  (lambda (u v n)
    (letrec ((loop
               (lambda (u v i)
                 (cond
                   ((= i n) #t)
                   ((> v 30) (loop (+ u d)
                                   c i))
                   (else (begin
                           (format #t "loop\t~s\t~s\t~s\t~s\n" u v i (sin i))
                           (let ((res (izhikevich u v (* 10 (sin i)))))
                             (loop (cdr res)
                                   (car res)
                                   (+ 1 i)))))))))
      (loop u v 0))))
(test u v 1001)

