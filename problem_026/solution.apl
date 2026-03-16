⍝ Problem 026: Reciprocal Cycles
⍝ Find d < 1000 with longest recurring cycle in 1/d.

∇ R ← CycleLen d;seen;rem;pos
  seen ← 1000⍴¯1
  rem ← 1
  pos ← 0
  :While rem ≠ 0
    :If seen[1+rem] ≥ 0
      R ← pos - seen[1+rem]
      →0
    :EndIf
    seen[1+rem] ← pos
    rem ← d|rem×10
    pos ← pos + 1
  :EndWhile
  R ← 0
∇

maxCycle ← 0
result ← 0
:For d :In 1+⍳998
  c ← CycleLen d
  :If c > maxCycle
    maxCycle ← c
    result ← d
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕result
