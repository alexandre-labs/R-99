#lang racket

;; P09 (**) Pack consecutive duplicates of list elements into sublists.
;;     If a list contains repeated elements they should be placed in separate sublists.
;;
;;     Example:
;;     * (pack '(a a a a b c c a a d e e e e))
;;     ((A A A A) (B) (C C) (A A) (D) (E E E E))

(define (pack-aux a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) a-list]
    [(not (eq? (car a-list) (car (cdr a-list)))) (cons (car a-list) '())]
    [else (cons (car a-list ) (pack-aux (cdr a-list)))]))

(define (pack-skip a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) '()]
    [(not (eq? (car a-list) (car (cdr a-list)))) (cdr a-list)]
    [else (pack-skip (cdr a-list))]))


(define (pack a-list)
  (cond
    [(eq? a-list '()) '()]
    [else (cons (pack-aux a-list) (pack (pack-skip a-list)))]))


(require rackunit)

(check-equal? (pack '()) '())
(check-equal? (pack '(1)) '((1)))
(check-equal? (pack '(1 1 2)) '((1 1) (2)))
(check-equal? (pack '(1 1 2 1 1)) '((1 1) (2) (1 1)))
