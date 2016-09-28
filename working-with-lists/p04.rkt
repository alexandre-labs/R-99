#lang racket

;; P04 (*) Find the number of elements of a list.

(provide my-length)

(define (my-length a-list)
  (cond
    [(eq? a-list '()) 0]
    [else (+ 1 (my-length (cdr a-list)))]))


(require rackunit)

(check-equal? (my-length '()) 0)
(check-equal? (my-length '(1)) 1)
(check-equal? (my-length '(1 2 3 4 5 6 7 8 9 10)) 10)
