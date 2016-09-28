#lang racket

(require "../p02.rkt")
(require rackunit)

(check-equal? (my-but-last '()) '())
(check-equal? (my-but-last '(1)) '(1))
(check-equal? (my-but-last '(a b c d)) '(c d))
