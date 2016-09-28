#lang racket

;; P18 (**) Extract a slice from a list.
;;     Given two indices, I and K, the slice is the list containing the elements between the I'th and K'th element of
;;     the original list (both limits included). Start counting the elements with 1.
;;
;;     Example:
;;     * (slice '(a b c d e f g h i k) 3 7)
;;     (C D E F G)

(require "p17.rkt")

(define (slice a-list i k)
  (cond
    [(eq? a-list '()) '()]
    [(> i 1) (slice (cdr a-list) (- i 1) (- k 1))]
    [(eq? k 1) (cons (car a-list) '())]
    [else (cons (car a-list) (slice (cdr a-list) (- i 1) (- k 1)))]))


(require rackunit)

(check-equal? (slice '() 1 2) '())
(check-equal? (slice '(1) 0 1) '(1))
(check-equal? (slice '(1 2 3 4 5 6 7) 0 1) '(1))
(check-equal? (slice '(1 2 3 4 5) 1 3) '(1 2 3))
(check-equal? (slice '(a b c d e f g h i k) 3 7) '(c d e f g))
