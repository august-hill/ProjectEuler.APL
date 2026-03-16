⍝ Problem 091: Right Triangles in Quadrants
⍝ How many right triangles with O(0,0), P(x1,y1), Q(x2,y2), 0<=x,y<=50?
⍝ Answer: 14234

N ← 50
count ← 0

:For x1 :In ⍳(N+1)
  :For y1 :In ⍳(N+1)
    :If (x1=1) ∧ (y1=1)  ⍝ both zero (0-indexed), skip
      →nextP
    :EndIf
    ax ← x1 - 1 ⋄ ay ← y1 - 1  ⍝ 0-indexed
    :For x2 :In ⍳(N+1)
      :For y2 :In ⍳(N+1)
        bx ← x2 - 1 ⋄ by ← y2 - 1
        :If (bx=0) ∧ (by=0)
          →nextQ
        :EndIf
        :If (ax=bx) ∧ (ay=by)
          →nextQ
        :EndIf
        ⍝ Avoid double counting
        :If (ax>bx) ∨ ((ax=bx) ∧ (ay>by))
          →nextQ
        :EndIf
        dotO ← (ax×bx) + ay×by
        dotP ← ((-ax)×(bx-ax)) + ((-ay)×(by-ay))
        dotQ ← ((-bx)×(ax-bx)) + ((-by)×(ay-by))
        :If (dotO=0) ∨ (dotP=0) ∨ (dotQ=0)
          count ← count + 1
        :EndIf
        nextQ:
      :EndFor
    :EndFor
    nextP:
  :EndFor
:EndFor

⎕ ← 'Result: ' , ⍕count
