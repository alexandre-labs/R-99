#lang racket

;; P12 (**) Decode a run-length encoded list.
;;     Given a run-length code list generated as specified in problem P11. Construct its uncompressed version.

(require "p15.rkt")

(define (decode-item item)
  (cond
    [(not (list? item)) (cons item '())]
    [else (repli-item (car (cdr item)) (car item))]))

(define (decode encoded-list)
  (cond
    [(eq? encoded-list '()) '()]
    [else (append (decode-item (car encoded-list)) (decode (cdr encoded-list)))]))


(require rackunit)

(check-equal? (decode '()) '())
(check-equal? (decode '((4 a) (1 b) (2 c) (2 a) (1 d)(4 e))) '(a a a a b c c a a d e e e e))
(check-equal? (decode '((4 a) b (2 c) (2 a) d (4 e))) '(a a a a b c c a a d e e e e))
