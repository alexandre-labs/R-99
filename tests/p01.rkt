#lang racket

(require "../p01.rkt")
(require rackunit)

(check-equal? (my-last '()) '())
(check-equal? (my-last '(1)) '(1))
(check-equal? (my-last '(a b c d)) '(d))
