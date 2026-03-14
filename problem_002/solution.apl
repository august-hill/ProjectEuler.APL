⍝ Problem 002: Even Fibonacci Numbers
⍝ Find the sum of all even-valued Fibonacci terms below 4 million.

⍝ Solution: generate Fibonacci sequence, filter even, sum
∇ R ← EvenFibSum limit
  R ← 0
  a ← 1
  b ← 2
  :While b < limit
    :If 0 = 2|b
      R ← R + b
    :EndIf
    t ← a + b
    a ← b
    b ← t
  :EndWhile
∇

result ← EvenFibSum 4000000
⎕ ← 'Result: ' , ⍕result
