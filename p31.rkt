#lang racket

;; P31 (**) Determine whether a given integer number is prime.
;;     Example:
;;     * (is-prime 7)
;;     T

(define (max-num num)
  (integer-sqrt num))

(define (limit-value-range num)
  (range 2 (+ num 1)))

(define (remove-multiple num a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (modulo (car a-list) num) 0) (remove-multiple num (cdr a-list))]
    [(eq? (cdr a-list) '()) a-list]
    [else (cons (car a-list) (remove-multiple num (cdr a-list)))]))

(define (sieve number-range max-num)
  ;; Sieve of Eratosthenes
  (cond
    [(eq? number-range '()) '()]
    [(eq? (car number-range) max-num) (cons (car number-range) (remove-multiple (car number-range) number-range))]
    [(> (car number-range) max-num) number-range]
    [else (cons (car number-range) (sieve (remove-multiple (car number-range) number-range) max-num))]))

(define (is-prime num)
  (cond
    [(< num 2) #f]
    [else (= (last (sieve (limit-value-range num) (max-num num))) num)]))

(require rackunit)

(check-equal? (max-num 25) 5)
(check-equal? (max-num 2) 1)

(check-equal? (limit-value-range 10) '(2 3 4 5 6 7 8 9 10))
(check-equal? (limit-value-range 30) '(2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30))

(check-equal? (remove-multiple 10 '()) '())
(check-equal? (remove-multiple 1 '(1)) '())
(check-equal? (remove-multiple 2 '(1 2 3 4 5 6 7 8 9 10)) '(1 3 5 7 9))

(check-equal? (sieve '(2) 1) '(2))
(check-equal? (sieve '(2 3) 1) '(2 3))
(check-equal? (sieve (limit-value-range 30) (max-num 30)) '(2 3 5 7 11 13 17 19 23 29))

(check-false (is-prime 0))
(check-false (is-prime 1))
(check-true (is-prime 2))
(check-true (is-prime 3))
(check-true (is-prime 5))
(check-true (is-prime 7))
(check-true (is-prime 7727))
(check-true (is-prime 7741))
(check-true (is-prime 7753))
(check-true (is-prime 7757))
(check-true (is-prime 7759))
(check-true (is-prime 7789))
(check-true (is-prime 7793))
(check-true (is-prime 7817))
(check-true (is-prime 7823))
(check-true (is-prime 7829))
(check-true (is-prime 7841))
(check-true (is-prime 7853))
(check-true (is-prime 7867))
(check-true (is-prime 7873))
(check-true (is-prime 7877))
(check-true (is-prime 7879))
(check-true (is-prime 7883))
(check-true (is-prime 7901))
(check-true (is-prime 7907))
(check-true (is-prime 7919))
