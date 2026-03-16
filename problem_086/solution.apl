⍝ Problem 086: Cuboid Route
⍝ Find least M such that cuboid shortest routes exceed 1000000.
⍝ Answer: 1818

count ← 0
m ← 0

:While 1
  m ← m + 1
  :For s :In 1+⍳(2×m)
    sq ← (m×m) + s×s
    root ← ⌊sq*0.5
    :If root×root = sq
      cMin ← 1⌈s-m
      cMax ← ⌊s÷2
      :If cMax ≥ cMin
        count ← count + cMax - cMin + 1
      :EndIf
    :EndIf
  :EndFor
  :If count > 1000000
    ⎕ ← 'Result: ' , ⍕m
    →0
  :EndIf
:EndWhile
