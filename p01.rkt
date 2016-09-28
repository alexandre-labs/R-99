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
