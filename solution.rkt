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
(define ops (list '+ '- '* '/))

(define ops2 (list + - * /))

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
(define appendedList (map make-rpn rpnList))


;e is element/expression
;s is stack
;checks if rpn is valid
(define (valid-rpn? e [s 0])
  (if (null? e)
      ;if list is null and 1 on stack return true as is valid else false
     (if(= s 1) #t #f)
     (if (= (car e) 1)
         (valid-rpn? (cdr e)(+ 1 s));Operator add one to stack
         (if (<(- s 1) 1);if stack is less than 1
          #f ;return false
         (valid-rpn? (cdr e)(- s 1)); should be an operator remove one from stack
         ))))        

;makes a true or false list of all valid rpn
;(define validList (map valid-rpn? (map make-rpn rpnList)))

;validList

;filters list of true false with the appendedlist of rpn to produce list of ValidRPN(42)
(define validRPNPatternList (filter (lambda(validList) (equal? (valid-rpn? validList)#t)) appendedList))

;validRPNPatternList

;720 permutations of list
;(length (permutations (list 1 2 3 4 5 6)))

;All permutations of list
(define (allNums l)
  remove-duplicates(permutations l))

;(allNums (list 1 2 3 4 5 6))

;Gets list of all possible cartesian products of a 5 operator list from list (+ - * /)
(define allOps (cartesian-product ops ops ops ops ops))

;1024 possible cartesian products
;(length allOps)

;combine allOps and allNums to get 2 lists of 5 ops and 6 nums
(define (twoList1 l)
(cartesian-product allOps (allNums l))) 

(define (twoList l)
(remove-duplicates(cartesian-product allOps (allNums l))))

;(remove-duplicates ((cartesian-product allOps (allNums (list 1 2 3 4 5 6)))))

;using list of same to reduce size
;(remove-duplicates (cartesian-product allOps (allNums '(1 1 1 1 1 1))))















;Passes a list of lists comtaining numbers and operators ('( + - * / -) '(1 2 3 4 5 6)  ('( + - * / -) '(1 2 3 4 5 6))) to a function
(define (applyRpnToList numOpsList)
     ;pass lists of nums and ops to 
     (map (lambda (x) (splitList x)) numOpsList))

;splits up a list consisting of two lists one number, one operator e.g. ('( + - * / -) '(1 2 3 4 5 6)) and passes the split lists to a function
(define (splitList numOpList)
     (applyRPN (car(cdr numOpList))(car numOpList) validRPNPatternList))

;applies pattern to all of the lists - returns a list of lists consisting of valid rpn patterns of lenght 11
(define (applyRPN numList opList rpnPattern)
     ;applys pattern to all of list
     (map (lambda (x) (applyListToPattern numList opList x '()) ) rpnPattern))

;applies the rpnpattern to single num and ops pair of lists - returns a list of length 11 e.g. (1 2 + 3 - 4 * 5 / 6 -)
(define (applyListToPattern numList opList rpnPattern rpnList)
  (if (= (length rpnList)11) ;until rpn is length 11 
  rpnList ;return rpn
  (if(= (car rpnPattern) 1) ;if pattern if 1 its a number else its an operator
     (applyListToPattern (cdr numList) opList (cdr rpnPattern) (append rpnList (cons(car numList)'()))) ;take one of numList
     (applyListToPattern numList (cdr opList) (cdr rpnPattern) (append rpnList (cons(car opList)'())))) ;take one of opsList
  ))


;TEST DATA
(define lnumList '(2 2 2 2 2 2))

;(define lopList '( + - * / -))

;makes rpn statement from given rpn pattern, number list and operator list
;(applyListToPattern (cdr lnumList) lopList (cdr lrpnPattern) (append lrpnList (cons(car lnumList)'())))

;makes a list of rpn statements from a given patternlist, number and operator list
;(applyRPN lnumList lopList validRPNPatternList)



; first list off list of lists
;(car(applyRpnToList (twoList lnumList)))

;list of lists
;(applyRpnToList (twoList lnumList))











