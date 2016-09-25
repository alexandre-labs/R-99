#lang racket

;; P33 (*) Determine whether two positive integer numbers are coprime.
;;     Two numbers are coprime if their greatest common divisor equals 1.
;;     Example:
;;     * (coprime 35 64)
;;     T

(require "p32.rkt")

(define (coprime number1 number2)
  (= (gcd number1 number2) 1))


(require rackunit)

(check-true (coprime 35 64))
