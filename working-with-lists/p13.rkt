#lang racket

;; P13 (**) Run-length encoding of a list (direct solution).
;;     Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the
;;     sublists containing the duplicates, as in problem P09, but only count them. As in problem P11, simplify the
;;       result list by replacing the singleton lists (1 X) by X.
;;
;;     Example:
;;     * (encode-direct '(a a a a b c c a a d e e e e))
;;     ((4 A) B (2 C) (2 A) D (4 E))

(define (pack-count a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) 1]
    [(not (eq? (car a-list) (car (cdr a-list)))) 1]
    [else (+ 1 (pack-count (cdr a-list)))]))

(define (pack-aux a-list)
  (cond
    [(eq? a-list '()) '()]
    [(or (eq? (cdr a-list) '()) (not (eq? (car a-list) (car (cdr a-list))))) (car a-list)]
    [else (cons (pack-count a-list) (cons (car a-list) '()))]))

(define (pack-skip a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) '()]
    [(not (eq? (car a-list) (car (cdr a-list)))) (cdr a-list)]
    [else (pack-skip (cdr a-list))]))

(define (encode-direct a-list)
  (cond
    [(eq? a-list '()) '()]
    [else (cons (pack-aux a-list) (encode-direct (pack-skip a-list)))]))


(require rackunit)

(check-equal? (encode-direct '(a a a a b c c a a d e e e e)) '((4 a) b (2 c) (2 a) d (4 e)))
