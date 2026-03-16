⍝ Problem 052: Permuted Multiples
⍝ Find smallest x where x, 2x, 3x, 4x, 5x, 6x contain same digits.
⍝ Answer: 142857

∇ R ← SortedDigits n
  R ← (⍋s)/s←⍕n
∇

:For x :In ⍳999999
  sig ← SortedDigits x
  ok ← 1
  :For m :In 1+⍳5
    :If sig ≢ SortedDigits x×(m+1)
      ok ← 0
      →nextX
    :EndIf
  :EndFor
  nextX:
  :If ok
    ⎕ ← 'Result: ' , ⍕x
    →0
  :EndIf
:EndFor
