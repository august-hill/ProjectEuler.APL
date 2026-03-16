⍝ Problem 085: Counting Rectangles
⍝ Find area of grid nearest to containing 2000000 rectangles.
⍝ Answer: 2772

target ← 2000000
bestArea ← 0
bestDiff ← target

:For m :In ⍳2000
  cm ← m × (m+1) ÷ 2
  :If cm > target
    →done
  :EndIf
  :For n :In m+⍳(2000-m+1)
    count ← cm × n × (n+1) ÷ 2
    diff ← |count - target
    :If diff < bestDiff
      bestDiff ← diff
      bestArea ← m × n
    :EndIf
    :If count > target
      →nextM
    :EndIf
  :EndFor
  nextM:
:EndFor
done:

⎕ ← 'Result: ' , ⍕bestArea
