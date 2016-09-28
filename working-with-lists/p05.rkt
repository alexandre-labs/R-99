#lang racket

;; P05 (*) Reverse a list.

(require "p01.rkt")
(require "p04.rkt")

(provide my-reverse)

(define (my-reverse a-list)
  (cond
    [(eq? '() a-list) '()]
    [(eq? (cdr a-list) '()) a-list]
    [(eq? (cddr a-list) '()) (cons
                               (car (my-last a-list))
                               (cons (car a-list) '()))]
    [else (cons
            (car (my-last a-list))
            (my-reverse  (take a-list (- (my-length a-list) 1))))]))


(require rackunit)

(check-equal? (my-reverse '()) '())
(check-equal? (my-reverse '(1 2)) '(2 1))
(check-equal? (my-reverse '(1 2 3 4 5 6 7 8 9 10)) '(10 9 8 7 6 5 4 3 2 1))
