#lang racket

;; P16 (**) Drop every N'th element from a list.
;;     Example:
;;     * (drop '(a b c d e f g h i k) 3)
;;     (A B D E G H K)

(define (enumerate a-list [pos 0])
  (cond
    [(eq? a-list '()) '()]
    [else (cons (cons (+ pos 1) (car a-list)) (enumerate (cdr a-list) (+ pos 1)))]))

(define (multiple? a b)
  (and (not (eq? a 0)) (eq? (modulo a b) 0)))

(define (my-drop a-list nth)
  (cond
    [(eq? a-list '()) '()]
    [else (map cdr (filter (λ (item) (not (multiple? (car item) nth))) (enumerate a-list)))]))


(require rackunit)

(check-equal? (enumerate '()) '())
(check-equal? (enumerate '(1)) '((1 . 1)))
(check-equal? (enumerate '(a b c d e)) '((1 . a) (2 . b) (3 . c) (4 . d) (5 . e)))

(check-false (multiple? 0 3))
(check-true (multiple? 3 3))
(check-true (multiple? 6 3))

(check-equal? (my-drop '() 1) '())
(check-equal? (my-drop '(1) 1) '())
(check-equal? (my-drop '(a b c d e f g h i k) 3) '(a b d e g h k))
