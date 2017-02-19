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
(define l (list (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

(define ll '( (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

;show all possibilities
ll

;show answered list
l




