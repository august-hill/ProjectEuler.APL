⍝ Problem 063: Powerful Digit Counts
⍝ How many n-digit positive integers exist which are also an nth power?
⍝ Answer: 49
⍝ Base can only be 1-9 (10^n always has n+1 digits).

count ← 0
:For base :In ⍳9
  n ← 1
  :While 1
    power ← base*n
    digits ← ≢⍕power
    :If digits = n
      count ← count + 1
    :ElseIf digits < n
      →nextBase
    :EndIf
    n ← n + 1
    :If n > 100
      →nextBase
    :EndIf
  :EndWhile
  nextBase:
:EndFor

⎕ ← 'Result: ' , ⍕count
