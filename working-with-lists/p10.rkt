#lang racket

;; P10 (*) Run-length encoding of a list.
;;     Use the result of problem P09 to implement the so-called run-length encoding data compression method.
;;     Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the
;;     element E.
;;
;;     Example:
;;     * (encode '(a a a a b c c a a d e e e e))
;;     ((4 A) (1 B) (2 C) (2 A) (1 D)(4 E))

(require "p09.rkt")

(define (encode-item item)
  (cond
    [(eq? item '()) '()]
    [else (cons (length item) (cons (car item) '()))]))

(define (encode-aux pack-list)
  (cond
    [(eq? pack-list '()) '()]
    [else (cons (encode-item (car pack-list)) (encode-aux (cdr pack-list)))]))

(define (encode a-list)
  (encode-aux (pack a-list)))


(require rackunit)

(check-equal? (encode '()) '())
(check-equal? (encode '(a a a a b c c a a d e e e e)) '((4 a) (1 b) (2 c) (2 a) (1 d)(4 e)))
