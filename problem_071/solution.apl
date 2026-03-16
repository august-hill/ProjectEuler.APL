⍝ Problem 071: Ordered Fractions
⍝ Find numerator of fraction immediately left of 3/7 with d <= 1000000.
⍝ Answer: 428570

bestN ← 0
bestD ← 1

:For d :In 1+⍳999999
  n ← ⌊(3×d - 1) ÷ 7
  ⍝ n/d > bestN/bestD ?
  :If (n × bestD) > (bestN × d)
    bestN ← n
    bestD ← d
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕bestN
