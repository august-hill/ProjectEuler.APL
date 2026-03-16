⍝ Problem 075: Singular Integer Right Triangles
⍝ How many values of L <= 1500000 have exactly one integer right triangle?
⍝ Answer: 161667
⍝ Generate primitive Pythagorean triples using parametric form.

LIMIT ← 1500000

∇ R ← GCD args;a;b;t
  a ← 1⌷args ⋄ b ← 2⌷args
  :While b ≠ 0
    t ← b ⋄ b ← a - b × ⌊a÷b ⋄ a ← t
  :EndWhile
  R ← a
∇

counts ← (1+LIMIT)⍴0
mMax ← ⌊(LIMIT÷2)*0.5

:For m :In 1+⍳mMax
  :For n :In ⍳(m-1)
    :If 0 = 2|(m-n)
      →nextN
    :EndIf
    :If 1 ≠ GCD m n
      →nextN
    :EndIf
    perim ← 2 × m × m + n
    :If perim > LIMIT
      →nextM
    :EndIf
    k ← perim
    :While k ≤ LIMIT
      counts[1+k] ← counts[1+k] + 1
      k ← k + perim
    :EndWhile
    nextN:
  :EndFor
  nextM:
:EndFor

result ← +/counts=1
⎕ ← 'Result: ' , ⍕result
