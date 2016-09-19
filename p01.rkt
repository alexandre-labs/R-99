#lang racket

;; P01 (*) Find the last box of a list.
;;     Example:
;;     * (my-last '(a b c d))
;;     (D)

(provide my-last)

(define (my-last a-list)
  (cond
    [(eq? '() a-list) '()]
    [(eq? (length a-list) 1) a-list]
    [else (my-last (cdr a-list))]))


(require rackunit)

(check-equal? (my-last '()) '())
(check-equal? (my-last '(1)) '(1))
(check-equal? (my-last '(a b c d)) '(d))
