#lang racket

;; P11 (*) Modified run-length encoding.
;;     Modify the result of problem P10 in such a way that if an element has no duplicates it is simply
;;     copied into the result list. Only elements with duplicates are transferred as (N E) lists.
;;
;;     Example:
;;     * (encode-modified '(a a a a b c c a a d e e e e))
;;     ((4 A) B (2 C) (2 A) D (4 E))

(require "p09.rkt")

(define (encode-item item)
  (cond
    [(eq? item '()) '()]
    [(eq? (length item) 1) (car item)]
    [else (cons (length item) (cons (car item) '()))]))

(define (encode-aux pack-list)
  (cond
    [(eq? pack-list '()) '()]
    [else (cons (encode-item (car pack-list)) (encode-aux (cdr pack-list)))]))

(define (encode-modified a-list)
  (encode-aux (pack a-list)))


(require rackunit)

(check-equal? (encode-modified '(a a a a b c c a a d e e e e)) '((4 a) b (2 c) (2 a) d (4 e)))
