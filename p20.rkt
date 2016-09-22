#lang racket

;; P20 (*) Remove the K'th element from a list.
;;     Example:
;;     * (remove-at '(a b c d) 2)
;;     (A C D)

(define (remove-at a-list kth)
  (cond
    [(eq? a-list '()) '()]
    [(< kth 1) a-list]
    [(eq? kth 1) (cdr a-list)]
    [else (cons (car a-list) (remove-at (cdr a-list ) (- kth 1)))]))


(require rackunit)

(check-equal? (remove-at '() 1) '())
(check-equal? (remove-at '(1) 2) '(1))
(check-equal? (remove-at '(1 2 3) 2) '(1 3))
(check-equal? (remove-at '(a b c d) 2) '(a c d))
