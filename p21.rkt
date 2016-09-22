#lang racket

;; P21 (*) Insert an element at a given position into a list.
;;     Example:
;;     * (insert-at 'alfa '(a b c d) 2)
;;     (A ALFA B C D)

(define (insert-at element a-list position)
  (cond
    [(> position (length a-list)) (append a-list (cons element '()))]
    [(eq? position 1) (cons element a-list)]
    [else (cons (car a-list) (insert-at element (cdr a-list) (- position 1)))]))


(require rackunit)

(check-equal? (insert-at 'alfa '() 1) '(alfa))
(check-equal? (insert-at 'beta '(alfa) 2) '(alfa beta))
(check-equal? (insert-at 'alfa '(beta) 1) '(alfa beta))
(check-equal? (insert-at 'alfa '(a b c d) 2) '(a alfa b c d))
