⍝ Problem 025: 1000-digit Fibonacci Number
⍝ Index of first Fibonacci number with 1000 digits.

⍝ APL handles big integers natively
fib1 ← 1
fib2 ← 1
term ← 2

:While (≢⍕fib2) < 1000
  temp ← fib1 + fib2
  fib1 ← fib2
  fib2 ← temp
  term ← term + 1
:EndWhile

⎕ ← 'Result: ' , ⍕term
