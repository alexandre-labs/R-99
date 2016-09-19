#lang racket

;; P08 (**) Eliminate consecutive duplicates of list elements.
;;     If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
;;
;;     Example:
;;     * (compress '(a a a a b c c a a d e e e e))
;;     (A B C A D E)

(define (compress a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) a-list]
    [(eq? (car a-list) (car (cdr a-list))) (compress (drop a-list 1))]
    [else (append (cons (car a-list) '()) (compress (drop a-list 1)))]))


(require rackunit)

(check-equal? (compress '()) '())
(check-equal? (compress '(1)) '(1))
(check-equal? (compress '(1 1)) '(1))
(check-equal? (compress '(a a a a b c c a a d e e e e)) '(a b c a d e))
