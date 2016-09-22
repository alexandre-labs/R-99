#lang racket

;;P22 (*) Create a list containing all integers within a given range.
;;    If first argument is smaller than second, produce a list in decreasing order.
;;    Example:
;;    * (range 4 9)
;;    (4 5 6 7 8 9)

(define (my-range start end)
  (cond
    [(not (<= start end)) '()]
    [else (cons start (my-range (+ start 1) end))]))

(require rackunit)

(check-equal? (my-range 0 10) '(0 1 2 3 4 5 6 7 8 9 10))
(check-equal? (my-range -10 0) '(-10 -9 -8 -7 -6 -5 -4 -3 -2 -1 0))
(check-equal? (my-range 4 9) '(4 5 6 7 8 9))
