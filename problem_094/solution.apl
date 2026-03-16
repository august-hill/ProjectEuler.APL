⍝ Problem 094: Almost Equilateral Triangles
⍝ Sum of perimeters of almost equilateral triangles (sides a,a,a+-1)
⍝ with integral area and perimeter <= 10^9.
⍝ Answer: 518408346
⍝ Uses recurrence relations.

limit ← 1000000000
total ← 0

⍝ Case 1: sides a, a, a+1. Perimeter = 3a+1.
⍝ Recurrence: a_{n+1} = 14*a_n - a_{n-1} - 4
aPrev ← 1 ⋄ aCurr ← 5
:While 1
  perim ← 3×aCurr + 1
  :If perim > limit
    →doneCase1
  :EndIf
  total ← total + perim
  aNext ← (14×aCurr) - aPrev - 4
  aPrev ← aCurr
  aCurr ← aNext
:EndWhile
doneCase1:

⍝ Case 2: sides a, a, a-1. Perimeter = 3a-1.
⍝ Recurrence: a_{n+1} = 14*a_n - a_{n-1} + 4
aPrev ← 1 ⋄ aCurr ← 17
:While 1
  perim ← 3×aCurr - 1
  :If perim > limit
    →doneCase2
  :EndIf
  total ← total + perim
  aNext ← (14×aCurr) - aPrev + 4
  aPrev ← aCurr
  aCurr ← aNext
:EndWhile
doneCase2:

⎕ ← 'Result: ' , ⍕total
