#lang racket

;; P09 (**) Pack consecutive duplicates of list elements into sublists.
;;     If a list contains repeated elements they should be placed in separate sublists.
;;
;;     Example:
;;     * (pack '(a a a a b c c a a d e e e e))
;;     ((A A A A) (B) (C C) (A A) (D) (E E E E))

;; get all elements until a different one
(define (take-while-eq a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) a-list]
    [(not (eq? (car a-list) (car (cdr a-list)))) (cons (car a-list) '()) ]
    [else (append (cons (car a-list) (take-while-eq (cdr a-list))))]))


(define (pack a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (cdr a-list) '()) a-list]
    [(not (eq? (car a-list) (car (cdr a-list)))) (append (take a-list 2) (pack (drop a-list 2)))]
    [else (cons (take a-list 2) (pack (drop a-list 2)))]
    ))


(require rackunit)

;;
;; take-while tests
;;
(check-equal? (take-while-eq '()) '())
(check-equal? (take-while-eq '(1 1)) '(1 1))
(check-equal? (take-while-eq '(1 1 2)) '(1 1))
(check-equal? (take-while-eq '(1 1 1 1 1 1 1 1 1 1 1 1 2)) '(1 1 1 1 1 1 1 1 1 1 1 1 ))
(check-equal? (take-while-eq '(1 1 2 1 1)) '(1 1))


;;
;; pack tests
;;
(check-equal? (pack '()) '())
(check-equal? (pack '(1)) '(1))
(check-equal? (pack '(1 2)) '(1 2))
(check-equal? (pack '(1 1 2)) '((1 1) 2))
(check-equal? (pack '(a a a a b c c a a d e e e e)) '((a a a a) (b) (c c) (a a) (d) (e e e e)))
