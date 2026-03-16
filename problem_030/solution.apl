⍝ Problem 030: Digit Fifth Powers
⍝ Sum of numbers equal to sum of fifth powers of their digits.

∇ R ← FifthPowerSum n;digits
  digits ← (10⊥⍣¯1) n
  R ← +/digits*5
∇

sum ← 0
:For n :In 1+⍳354293
  :If n = FifthPowerSum n
    sum ← sum + n
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕sum
