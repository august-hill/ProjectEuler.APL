⍝ Problem 093: Arithmetic Expressions
⍝ Find set of four digits generating longest run of consecutive positive integers.
⍝ Answer: 1258

∇ R ← EvalAll args;a;b;results
  a ← 1⌷args ⋄ b ← 2⌷args
  results ← (a+b)(a-b)(b-a)(a×b)
  :If (|b) > 1E¯12
    results ← results , a÷b
  :EndIf
  :If (|a) > 1E¯12
    results ← results , b÷a
  :EndIf
  R ← results
∇

bestDigits ← 0
bestCount ← 0

:For a :In ⍳6
  :For b :In (a+1)+⍳(9-a-2)
    :For c :In (b+1)+⍳(9-b-1)
      :For d :In (c+1)+⍳(9-c)
        digits ← a b c d
        seen ← 3500⍴0
        ⍝ All 24 permutations
        :For i :In ⍳4
          :For j :In ⍳4
            :If j=i ⋄ →nextJ ⋄ :EndIf
            :For k :In ⍳4
              :If (k=i)∨(k=j) ⋄ →nextK ⋄ :EndIf
              l ← 10 - i - j - k
              w ← digits[i] ⋄ x ← digits[j] ⋄ y ← digits[k] ⋄ z ← digits[l]

              ⍝ ((w op x) op y) op z
              wx ← EvalAll w x
              :For wxi :In wx
                wxy ← EvalAll wxi y
                :For wxyi :In wxy
                  wxyz ← EvalAll wxyi z
                  :For r :In wxyz
                    :If (r>0.5) ∧ (r<3500) ∧ ((|r-⌊r+0.5)<1E¯9)
                      seen[⌊r+0.5] ← 1
                    :EndIf
                  :EndFor
                :EndFor
              :EndFor

              ⍝ (w op x) op (y op z)
              yz ← EvalAll y z
              :For wxi :In wx
                :For yzi :In yz
                  res ← EvalAll wxi yzi
                  :For r :In res
                    :If (r>0.5) ∧ (r<3500) ∧ ((|r-⌊r+0.5)<1E¯9)
                      seen[⌊r+0.5] ← 1
                    :EndIf
                  :EndFor
                :EndFor
              :EndFor
              nextK:
            :EndFor
            nextJ:
          :EndFor
        :EndFor

        ⍝ Count consecutive from 1
        cnt ← 0
        :For n :In ⍳3499
          :If seen[n]
            cnt ← n
          :Else
            →doneCnt
          :EndIf
        :EndFor
        doneCnt:
        :If cnt > bestCount
          bestCount ← cnt
          bestDigits ← a×1000 + b×100 + c×10 + d
        :EndIf
      :EndFor
    :EndFor
  :EndFor
:EndFor

⎕ ← 'Result: ' , ⍕bestDigits
