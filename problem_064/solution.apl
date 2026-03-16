⍝ Problem 064: Odd Period Square Roots
⍝ How many continued fractions for sqrt(N), N <= 10000, have an odd period?
⍝ Answer: 1322

count ← 0
:For n :In 1+⍳9999
  a0 ← ⌊n*0.5
  :If a0×a0 = n
    →nextN
  :EndIf
  m ← 0 ⋄ d ← 1 ⋄ a ← a0
  period ← 0
  :While 1
    m ← d×a - m
    d ← (n - m×m) ÷ d
    a ← ⌊(a0 + m) ÷ d
    period ← period + 1
    :If a = 2×a0
      →doneP
    :EndIf
  :EndWhile
  doneP:
  :If 1 = 2|period
    count ← count + 1
  :EndIf
  nextN:
:EndFor

⎕ ← 'Result: ' , ⍕count
