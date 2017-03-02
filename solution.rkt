#lang racket
;Author Martin Coleman
;Date 15/02/17

;Fourth Year Project For Theory of Algorithms Module
;Info here about script

;Target Number: 101 - 999
;list of 6 numbers: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100]

;operations
(define ops '(+ - * /))


;temp values for testing
(define a 5)
(define b 25)
(define target 125)

;all possibilities for 2 num list
;(+ a b)
;(- a b)
;(* a b)
;(/ a b)
;(+ b a)
;(- b a)
;(* b a)
;(/ b a)

;list of all possibilities
;(define l (list (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

;(define ll '( (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

;show all possibilities
;ll

;show answered list
;l

;Method that take in Target nember and list of possible numbers
(define (solvecount target listNum)
  (computeTwo (car listNum) (cadr listNum)))


(define (computeTwo a b)
  (list (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

;all possible operations on two numbers
;(computeTwo 1 2)

;test method solveCount
;(solvecount 123 (list 2 2))
;(solvecount 123 (list 3 3))
;(solvecount 123 (list 4 4))

;(permutations '(a b c d + - * /))

;(combinations (list 1 2 3 4 5 6) 2)

; all the possible selections from the original list.
;(combinations (list 1 2 3 4 5 6))

;(cartesian-product '(+ - * /) '(1 2 3) '(4 5 6))

(define (plus l)
  (+ (car l)(cadr l)))

;(map plus (combinations (list 1 2 3 4 5 6 )2))

;(map plus (combinations (list  (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a))2))

;(combinations '(a b + - * / )3)
;(combinations '(c d + - * / )3)
;(combinations '(e f + - * / )3)


;(cartesian-product '(a b c d) '(b c d) '(+ - * /))
;(cartesian-product '(a b c d) '(b c d) '(c) '(+ - * /))

;all permutations of a list and an operator
;(cartesian-product (permutations '(a b)) '(+ - * /))

;gets all possibilities for 2
(define (allPos l)
  (cartesian-product (permutations (list (car l) (cadr l))) '(+ - * /)))

(allPos (list 1 2 3 4))


  































