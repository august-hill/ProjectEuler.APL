⍝ Problem 065: Convergents of e
⍝ Find sum of digits in numerator of 100th convergent of e.
⍝ Answer: 272
⍝ APL handles big integers natively.

∇ R ← CFCoeff k
  :If k = 0
    R ← 2 ⋄ →0
  :EndIf
  j ← k - 1
  :If 1 = 3|j
    R ← 2 × (⌊j÷3) + 1
  :Else
    R ← 1
  :EndIf
∇

h2 ← 1   ⍝ h_{-1}
h1 ← 2   ⍝ h_0

:For k :In ⍳99
  a ← CFCoeff k
  newH ← (a × h1) + h2
  h2 ← h1
  h1 ← newH
:EndFor

result ← +/(10⊥⍣¯1) h1
⎕ ← 'Result: ' , ⍕result
