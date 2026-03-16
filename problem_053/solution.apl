⍝ Problem 053: Combinatoric Selections
⍝ Count C(n,r) > 1000000 for 1 <= n <= 100.
⍝ Answer: 4075
⍝ Use Pascal's triangle approach with capping.

LIMIT ← 1000000
prev ← 102⍴0
prev[1] ← 1
count ← 0

:For n :In ⍳100
  curr ← 102⍴0
  curr[1] ← 1
  :For r :In ⍳n
    curr[1+r] ← prev[r] + prev[1+r]
    :If curr[1+r] > LIMIT
      curr[1+r] ← LIMIT + 1
      count ← count + 1
    :EndIf
  :EndFor
  prev ← curr
:EndFor

⎕ ← 'Result: ' , ⍕count
