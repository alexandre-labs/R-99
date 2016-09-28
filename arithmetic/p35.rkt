#lang racket

;; P35 (**) Determine the prime factors of a given positive integer.
;;     Construct a flat list containing the prime factors in ascending order.
;;     Example:
;;     * (prime-factors 315)
;;     (3 3 5 7)

(require "p31.rkt")

(define (prime-factors-aux prime-range num)
  ;; prime-range -> List of prime numbers less than `num`
  (cond
    [(or (<= num 1) (is-prime? num)) (cons num '())]
    [(not (eq? (modulo num (car prime-range)) 0)) (prime-factors-aux (cdr prime-range) num)]
    [else (cons (car prime-range) (prime-factors-aux prime-range (/ num (car prime-range))))]))

(define (prime-factors num)
  (prime-factors-aux (sieve (range 2 num) num) num))


(require rackunit)

(check-equal? (prime-factors-aux '() 1) '(1))
(check-equal? (prime-factors-aux '(2) 2) '(2))
(check-equal? (prime-factors 315) '(3 3 5 7))
(check-equal? (prime-factors 100) '(2 2 5 5))
