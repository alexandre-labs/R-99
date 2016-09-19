#lang racket

;; P07 (**) Flatten a nested list structure.
;;     Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).
;;
;;     Example:
;;     * (my-flatten '(a (b (c d) e)))
;;     (A B C D E)
;;
;;     Hint: Use the predefined functions list and append.

(define (my-flatten a-list)
  a-list)


(require rackunit)

(check-equal? (my-flatten '()) '())
(check-equal? (my-flatten '(1)) '(1))
(check-equal? (my-flatten '(1 (2))) '(1 2))
