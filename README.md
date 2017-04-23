# Countdown Numbers Game Solver 
Fourth Year Project For Theory of Algorithms Module

#### Author: 
Martin Coleman

#### Wiki:
https://github.com/Martinc94/CountdownNumbersGame/wiki

### Summary of Problem:
Write a racket script that contains a function that accepts two arguments:

1- The target number 

2- A list of six random numbers

The function must return a combination of the given numbers and the operators that compute the target number if possible.

All Six numbers dont have to be used in calculation.

No negative numbers and fractions.

### Countdown 
Countdown is a Television game show broadcast of Channel 4. It contains a variety of word and number games. The countdown numbers game requires contestants to compute a list of six number to a given target within sixty seconds. The contestant with the correct solution of nearest solution to the target wins.

Example of the game being played:

https://www.youtube.com/watch?v=pfa3MHLLSWI

### Racket
Racket is a functional programming language. It was heavily infulenced by Lisp and Scheme.
It works mainly with lists and recursion. More information on racket is available here: https://racket-lang.org/

### Reverse Polish Notation
Reverse Polish Notation is a mathematical notation where operators follow its operands e.g (1 2 +) represents (1 + 2).
It works well with computers as it resembles a stack. Computers can read RPN without the use of recursive parsing.

### How to run:
1- Download DrRacket from here: https://racket-lang.org/download/

2- Install and open DrRacket

3- Open Solution.rkt

4- Run using run button or CTRL+R

5- Use solvecount method and params

Example: (solvecount 120 (list 100 6 5 5 2 2))

solvecount is the method name.

120 is the target number.

(list 100 6 5 5 2 2) is the list of 6 numbers used to compute the target number.

The script will return a solution if it can find one.

### Project Management
I used GitHub for managing the projects source control and issue tracking.

### Problem Solving
My first attempt at solving this problem was to solve a list containing all permitations of two numbers.

(define (computeTwo a b) (list (+ a b) (- a b) (* a b) (/ a b) (+ b a) (- b a) (* b a) (/ b a)))

Then I attempted to generate all the possibilities of number and operators using cartesian product and permutations and various other methods.

e.g. (cartesian-product (permutations (list (car l) (cadr l))) '(+ - * /))

After this I handled the validation of the Target and the list so no invalid combinations could be used and alert the user to what is wrong.

After some more classes talking about the project I drew out on paper how I was going to go about solving the problem.

When I had generated the list of all RPN, filtered the correct patterns of RPN and Generated all the permutations of the number and permutations of lenght 5 for the operators I had to apply the lists of the permuations to the valid patterns.

When I had created the list of all the valid permutations I created the methods for evaluating rpn and all the methods used for connecting the various operations together.

As I used alot of methods and tested them as the were being created I didnt run into any major problems that couldnt easily be solved or worked around. I could walk through each step/operation and connect them together method by method to create the desired solution.

I have left some of the individual method in the bottom of the script if users wish to see what the individual methods return.

Once I had gained an unstanding of Racket and had wrote on paper in small steps what I had to do I was able to understand the problem better.

### Possible Improvements
A small adjustment to the script would allow that all the solutions could be mapped and returned instead of printing the first correct method.

The script currently returns results in Reverse polish notation, another method could be used to to convert from RPN to a BOMDAS format.

### References
1. https://racket-lang.org/
2. https://cs.stackexchange.com/questions/4666/what-is-the-significance-of-reverse-polish-notation
3. https://groups.csail.mit.edu/mac/projects/scheme/
