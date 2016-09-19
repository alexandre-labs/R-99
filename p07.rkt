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
  (println a-list)
  (cond
    [(eq? a-list '()) '()]
    [(list? (car a-list)) (cons (car (car a-list)) (my-flatten (cdr a-list)))]
    [else (cons (car a-list) (my-flatten (cdr a-list)))]))


(require rackunit)

(check-equal? (my-flatten '()) '())
(check-equal? (my-flatten '(1)) '(1))
(check-equal? (my-flatten '((2))) '(2))
(check-equal? (my-flatten '(1 (2))) '(1 2))
(check-equal? (my-flatten '((2) 3 4 5)) '(2 3 4 5))
(check-equal? (my-flatten '(a (b (c d) e))) '(a b c d e))
