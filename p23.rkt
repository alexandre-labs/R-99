#lang racket

;; P23 (**) Extract a given number of randomly selected elements from a list.
;;     The selected items shall be returned in a list.
;;     Example:
;;     * (rnd-select '(a b c d e f g h) 3)
;;     (E D A)
;;
;;     Hint: Use the built-in random number generator and the result of problem P20.

(define (extract a-list pos)
  (cond
    [(eq? a-list '()) null]
    [(eq? pos 1) (car a-list)]
    [else (extract (cdr a-list) (- pos 1))]))

(define (rnd-select a-list num)
  (cond
    [(eq? a-list '()) '()]
    [(eq? num 0) '()]
    [else (cons (extract a-list (random (length a-list))) (rnd-select a-list (- num 1)))]))


(require rackunit)

(check-equal? (rnd-select '() 3) '())
(check-equal? (length (rnd-select '(1 2 3 4 5 6 7 8 9 0) 3)) 3)
(check-equal? (length (rnd-select '(a b c d e f g h) 3)) 3)
