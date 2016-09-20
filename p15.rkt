#lang racket

;; P15 (**) Replicate the elements of a list a given number of times.
;;     Example:
;;     * (repli '(a b c) 3)
;;     (A A A B B B C C C)

(define (repli-item item times)
  (cond
    [(eq? times 0) item]
    [(eq? times 1) (cons item '())]
    [else (append (cons item '()) (repli-item item (- times 1)))]))

(define (repli a-list times)
  (cond
    [(eq? a-list '()) '()]
    [else (append (repli-item (car a-list) times) (repli (cdr a-list) times))]))


(require rackunit)

(check-equal? (repli-item 1 0) 1)
(check-equal? (repli-item 1 1) '(1))
(check-equal? (repli-item 1 10) '(1 1 1 1 1 1 1 1 1 1))

(check-equal? (repli '() 1) '())
(check-equal? (repli '() 10) '())
(check-equal? (repli '(1) 2) '(1 1))
(check-equal? (repli '(a b c) 3) '(a a a b b b c c c))
