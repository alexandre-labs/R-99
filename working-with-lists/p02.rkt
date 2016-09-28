#lang racket

;; P02 (*) Find the last but one box of a list.
;;     Example:
;;     * (my-but-last '(a b c d))
;;     (C D)

(provide my-but-last)

(define (my-but-last a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) a-list]
    [(eq? (cddr a-list) '()) a-list] ;; cddr is the same than (cdr (cdr v))
    [else (my-but-last (cdr a-list))]))
