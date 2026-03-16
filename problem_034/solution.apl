⍝ Problem 034: Digit Factorials
⍝ Sum of all numbers equal to sum of factorial of their digits.

factorials ← 1 1 2 6 24 120 720 5040 40320 362880

∇ R ← DigitFactSum n;digits
  digits ← (10⊥⍣¯1) n
  R ← +/factorials[1+digits]
∇

sum ← 0
:For n :In 2+⍳2540158
  :If n = DigitFactSum n
    sum ← sum + n
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕sum
