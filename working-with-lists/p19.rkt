#lang racket

;; P19 (**) Rotate a list N places to the left.
;;     Examples:
;;     * (rotate '(a b c d e f g h) 3)
;;     (D E F G H A B C)
;;
;;     * (rotate '(a b c d e f g h) -2)
;;     (G H A B C D E F)
;;
;;     Hint: Use the predefined functions length and append, as well as the result of problem P17.

(require "p17.rkt")

(define (rotate a-list places)
  (cond
    [(eq? a-list '()) '()]
    [(eq? (length a-list) (abs places)) a-list]
    [(eq? places 0) a-list]
    [(< places 0) (rotate (cons (last a-list) (split-first-part a-list (- (length a-list) 1))) (+ places 1))]
    [else (append (split-rest a-list places) (split-first-part a-list places))]))


(require rackunit)

(check-equal? (rotate '() 3) '())
(check-equal? (rotate '(a b c) -3) '(a b c))
(check-equal? (rotate '(a b c) 3) '(a b c))
(check-equal? (rotate '(a b c d e f g h) 3) '(d e f g h a b c))
(check-equal? (rotate '(a b c d e f g h) -2) '(g h a b c d e f))
