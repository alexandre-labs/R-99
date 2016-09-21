#lang racket

;; P16 (**) Drop every N'th element from a list.
;;     Example:
;;     * (drop '(a b c d e f g h i k) 3)
;;     (A B D E G H K)

(define (my-drop a-list nth)
  (println a-list)
  (cond
    [(eq? a-list '()) '()]
    [(eq? nth 0) a-list]
    [(eq? nth 1) (cdr a-list)]
    [else (cons (car a-list) (my-drop (cdr a-list) (- nth 1)))]))


(require rackunit)

(check-equal? (my-drop '() 1) '())
(check-equal? (my-drop '(1) 1) '())
(check-equal? (my-drop '(a b c d e f g h i k) 3) '(a b d e g h k))
