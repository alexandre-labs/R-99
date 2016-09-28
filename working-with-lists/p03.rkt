#lang racket

;; P03 (*) Find the K'th element of a list.
;;     The first element in the list is number 1.
;;     Example:
;;     * (element-at '(a b c d e) 3)
;;     C

(define (element-at a-list kth)
  (cond
    [(null? a-list) '()]
    [(eq? kth 1) (car a-list)]
    [else (element-at (cdr a-list) (- kth 1))]))


(require rackunit)

(check-equal? (element-at '(1) 1) 1)
(check-equal? (element-at '() 0) '())
(check-equal? (element-at '(1 2) 2) 2)
(check-equal? (element-at '(a b c d e) 3) 'c)
