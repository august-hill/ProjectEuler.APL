⍝ Problem 045: Triangular, Pentagonal, and Hexagonal
⍝ Find next number after 40755 that is triangular, pentagonal, and hexagonal.
⍝ Answer: 1533776805
⍝ Every hexagonal number is triangular, so just find next hex that is also pentagonal.

pn ← 1 ⋄ hn ← 1
p ← 1 ⋄ h ← 1

:While 1
  :If hn < pn
    h ← h + 1
    hn ← h × (2×h - 1)
  :ElseIf pn < hn
    p ← p + 1
    pn ← p × (3×p - 1) ÷ 2
  :Else
    :If hn > 40755
      ⎕ ← 'Result: ' , ⍕hn
      →0
    :EndIf
    p ← p + 1
    pn ← p × (3×p - 1) ÷ 2
    h ← h + 1
    hn ← h × (2×h - 1)
  :EndIf
:EndWhile
