#lang racket

;; P02 (*) Find the last but one box of a list.
;;     Example:
;;     * (my-but-last '(a b c d))
;;     (C D)

(define (my-but-last a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) a-list]
    [(eq? (cddr a-list) '()) a-list] ;; cddr is the same than (cdr (cdr v))
    [else (my-but-last (cdr a-list))]))


(require rackunit)

(check-equal? (my-but-last '()) '())
(check-equal? (my-but-last '(1)) '(1))
(check-equal? (my-but-last '(a b c d)) '(c d))
