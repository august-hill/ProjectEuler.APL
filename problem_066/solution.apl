⍝ Problem 066: Diophantine Equation
⍝ Find D <= 1000 for which minimal x in x^2 - D*y^2 = 1 is largest.
⍝ Answer: 661
⍝ Uses continued fraction expansion to solve Pell's equation.
⍝ APL handles big integers natively.

bestX ← 0
bestD ← 0

:For d :In 1+⍳999
  a0 ← ⌊d*0.5
  :If a0×a0 = d
    →nextD
  :EndIf
  m ← 0 ⋄ dn ← 1 ⋄ a ← a0
  h2 ← 1 ⋄ h1 ← a0
  k2 ← 0 ⋄ k1 ← 1
  :While 1
    m ← dn×a - m
    dn ← (d - m×m) ÷ dn
    a ← ⌊(a0 + m) ÷ dn
    newH ← (a × h1) + h2
    newK ← (a × k1) + k2
    :If (newH×newH) = 1 + d×newK×newK
      :If newH > bestX
        bestX ← newH
        bestD ← d
      :EndIf
      →nextD
    :EndIf
    h2 ← h1 ⋄ h1 ← newH
    k2 ← k1 ⋄ k1 ← newK
  :EndWhile
  nextD:
:EndFor

⎕ ← 'Result: ' , ⍕bestD
