#lang racket

;; P17 (*) Split a list into two parts; the length of the first part is given.
;;     Do not use any predefined functions.
;;
;;     Example:
;;     * (split '(a b c d e f g h i k) 3)
;;     ( (A B C) (D E F G H I K))

(provide split-first-part split-rest)

(define (split-first-part a-list size)
  (cond
    [(eq? a-list '()) '()]
    [(eq? size 0) '()]
    [else (cons (car a-list) (split-first-part (cdr a-list) (- size 1)))]))

(define (split-rest a-list skip)
  (cond
    [(eq? a-list '()) '()]
    [(eq? skip 0) a-list]
    [else (split-rest (cdr a-list) (- skip 1))]))

(define (split a-list first-part-length)
  (cons (split-first-part a-list first-part-length) (cons (split-rest a-list first-part-length) '())))


(require rackunit)

(check-equal? (split-first-part '() 2) '())
(check-equal? (split-first-part '(1) 2) '(1))
(check-equal? (split-first-part '(1 2 3 4 5 6) 3) '(1 2 3))

(check-equal? (split-rest '() 2) '())
(check-equal? (split-rest '(1) 2) '())
(check-equal? (split-rest '(1 2) 2) '())
(check-equal? (split-rest '(1 2 3) 2) '(3))
(check-equal? (split-rest '(1 2 3 4 5 6 7) 3) '(4 5 6 7))

(check-equal? (split '(a b c d e f g h i k) 3) '((a b c) (d e f g h i k)))
