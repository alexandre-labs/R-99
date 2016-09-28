#lang racket

;;P14 (*) Duplicate the elements of a list.
;;    Example:
;;    * (dupli '(a b c c d))
;;    (A A B B C C C C D D)

(define (dupli a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) (append a-list a-list)]
    [else (append (cons (car a-list) (cons (car a-list) '())) (dupli (cdr a-list)))]))


(require rackunit)

(check-equal? (dupli '()) '())
(check-equal? (dupli '(1)) '(1 1))
(check-equal? (dupli '(1 2)) '(1 1 2 2))
(check-equal? (dupli '(1 2 3)) '(1 1 2 2 3 3))
(check-equal? (dupli '(a b c c d)) '(a a b b c c c c d d))
