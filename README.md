# Countdown Numbers Game Solver 
Fourth Year Project For Theory of Algorithms Module

#### Author: 
Martin Coleman

### Summary of Problem:
Write a racket script that contains a function that accepts two arguments:

1- The target number 

2- A list of six random numbers

The function must return a combonation of the given numbers and the operators that compute the target number if possible.

All Six numbers dont have to be used in calculation.
No negative numbers and fractions.

### How to run:
1- Download DrRacket from here: https://racket-lang.org/download/

2- Install and open DrRacket

3- Open Solution.rkt

4- Run using run button or CTRL+R

5- Use solvecount method and params
Example: (solvecount 125 (list 1 2 3 4 5 6))

solvecount is method name.

125 is the target number.

(list 1 2 3 4 5 6) is the list of 6 numbers used to compute the target number.

### Project Management
I used GitHub for managing the projects source control and issue tracking.

### Problem Solving
My first attempt at solving this problem was to solve a list containing all permitations of two numbers.

(define (computeTwo a b) (list (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

Then i attempted to generate all the possibilities of number and operators using cartesian product and permutations and various other methods.

(cartesian-product (permutations (list (car l) (cadr l))) '(+ - * /))
