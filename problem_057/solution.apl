⍝ Problem 057: Square Root Convergents
⍝ In the first 1000 expansions, how many have numerator with more digits than denominator?
⍝ Answer: 153
⍝ Recurrence: n' = n + 2d, d' = n + d. APL handles big integers natively.

n ← 1
d ← 1
count ← 0

:For i :In ⍳1000
  newN ← n + 2×d
  newD ← n + d
  n ← newN
  d ← newD
  :If (≢⍕n) > ≢⍕d
    count ← count + 1
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕count
