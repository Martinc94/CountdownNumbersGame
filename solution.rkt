#lang racket
;Author Martin Coleman
;Date 15/02/17

;Fourth Year Project For Theory of Algorithms Module
;Info here about script

;Rules
;Target Number: 101 - 999
;list of valid numbers to choose from: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100]

; VARIABLE DEFINITIONS //////////////////////////////////////////////////////////////////////////////////////////////////////

;Defines a list of all valid operations(+-*/)
(define ops '(+ - * /))

;All possible numbers that can be in 6 number list
(define possibleNumList (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))
;Min target number
(define minTarget 101)
;Max target number
(define maxTarget 999)

;METHOD DEFINITIONS //////////////////////////////////////////////////////////////////////////////////////////////////////

;Method that take in Target nember and list of possible numbers
(define (solvecount target listNum)
  ;if checks if target number is valid
  (if (= (targetWithinRange target) 0)
      ;if invalid return message
      (write "Target Number isnt withing the range 101-999")
      ;if valid pass to next method
      (if (= (validNumbers listNum) 1)
          ;if valid list pass to solve
          (solve target listNum)
          (write "Invavid List"))))

;//////////////////////////////////////////////////////////////////////////////////////////////////////
;returns target if target is within Range of max min else returns 0
(define (targetWithinRange target)
  (if (<= target minTarget)
      0
      (if (>= target maxTarget)
          0
          target)))

;//////////////////////////////////////////////////////////////////////////////////////////////////////
;Checks if list has 6 numbers and list is composed from set of valid numbers
(define (validNumbers listNum)
  ;check if list has 6 numbers
  (if (= (length listNum) 6)
      ;check if list numbers are valid (no duplicate unless allowed on list twice)
      (isValidList listNum possibleNumList)
      ;return 0 if not 6 nums in list
      0))

;//////////////////////////////////////////////////////////////////////////////////////////////////////
;Checks if given List is valid
(define (isValidList listNum posList)
  (if (null? listNum)
      1
      ;check if number is on list
      (if (member (car listNum) posList)
          ;recurse with rest of list and remove of possible list 
         (isValidList (cdr listNum)(remove (car listNum) posList))
         ;return 0 if num not in poslist
         0)))

;//////////////////////////////////////////////////////////////////////////////////////////////////////
;
(define (solve target listNum)
  (write "generate all combinations"))

;//////////////////////////////////////////////////////////////////////////////////////////////////////

;TEST METHODS//////////////////////////////////////////////////////////////////////////////////////////////////////


;test method solveCount
;(solvecount 125 (list 1 2 3 4 5 6))

;test method solve
;(solve 125 (list 1 2 3 4 5 6))





; -1 represents an operator
;  1 represents a number
(define start-perm (list -1 -1 -1 -1 1 1 1 1))

;gets all permiations of a list
;removes dublicates from list 
(define rpnList (remove-duplicates (permutations start-perm)))

;add 2 numbers to the start and operator to the end of list as valid rpn requires
(define (make-rpn l)
  (append (list 1 1) l (list -1)))

;append to all of list
(map make-rpn rpnList)

;e is element/expression
;s is stack
;checks if rpn is valid
(define (valid-rpn? e [s 0])
  (if (null? e)
      ;if 1 on stack true else false
     (if(= s 1) #t #f)
     (if (= (car e) 1)
         (valid-rpn? (cdr e)(+ 1 s));Add one to stack
         ;
         (valid-rpn? (cdr e)(- 1 s));should be an operator stack has 2 remove from stack
         )))

;makes a map of all valid rpn
(map valid-rpn? (map make-rpn rpnList))





































;Rough work //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;temp values for testing
;(define a 5)
;(define b 25)
;(define target 125)


;all possibilities for 2 num list
;(+ a b)(- a b)(* a b)(/ a b)(+ b a)(- b a)(* b a)(/ b a)

;defined list of all 2 num possibilities
;(define l (list (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

;defined list of all 2 num possibilities with quote
;(define ll '( (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

;show list of all possibilities
;ll

;show answered list
;l

;(define (computeTwo a b)(list (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

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

;(define (plus l)
;  (+ (car l)(cadr l)))

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
;(define (allPos l)
 ; (cartesian-product (permutations (list (car l) (cadr l))) '(+ - * /)))

;(allPos (list 1 2 3 4))

;(cartesian-product (permutations (list (car l) (cadr l))) '(+ - * /))

;(cartesian-product (permutations (list (cadr l) (cadr (cdr l)))) '(+ - * /))

;(define (my-length lst)
  ; local function iter:
 ; (define (iter lst result)
 ;   (cond
 ;    [(empty? lst) result]
 ;    [else (iter (cartesian-product (permutations (list (car l) (cadr l))) '(+ - * /)) (+ result 1))]))
  ; body of my-length calls iter:
  ;(iter lst 0))

;(my-length l)

;(define (allPos2 l)
 ; (cartesian-product  (list(car l )) (list (car l) (cadr l)) '(+ - * /)
                   ;   (list(car l)) (list (car l) (cadr l)) '(+ - * /)
                   ;   (list(car l)) (list (car l) (cadr l)) '(+ - * /)

                   ;  ))

;(allPos2 (list 1 2 3 4))

