#lang racket

;; P06 (*) Find out whether a list is a palindrome.
;;     A palindrome can be read forward or backward; e.g. (x a m a x).

(require "p05.rkt")

(define (palindrome? a-list)
  (equal? a-list (my-reverse a-list)))

(require rackunit)

(check-true (palindrome? '()))
(check-true (palindrome? '(a)))
(check-true (palindrome? '(a a)))
(check-false (palindrome? '(a b)))
(check-true (palindrome? '(x a m a x)))
