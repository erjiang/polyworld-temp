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
               (lambda (u v i spikes)
                 (cond
                   ((= i n) spikes)
                   ((> v 30) (begin
                               (format #t "spike\n")
                               (loop (+ u d)
                                     c i (cons i spikes))))
                   (else (begin
                           (format #t "loop\t~10,8f\t~10,8f\t~d\t~f\n" u v i (* 10 (sin (/ i 100))))
                           (let ((res (izhikevich u v (* 10 (sin (/ i 100))))))
                             (loop (cdr res)
                                   (car res)
                                   (+ 1 i)
                                   spikes))))))))
      (loop u v 0 '()))))
(let ((spikes (test u v 1001)))
  (format #t "spikes: ")
  (for-each (lambda (d) (format #t " ~d" d)) spikes))
