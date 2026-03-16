⍝ Problem 019: Counting Sundays
⍝ How many Sundays fell on the first of the month (1901-2000)?

∇ R ← IsLeap y
  R ← ((0=4|y)∧(0≠100|y))∨(0=400|y)
∇

∇ R ← DaysInMonth args;m;y
  m ← 1⌷args ⋄ y ← 2⌷args
  R ← (0 31 28 31 30 31 30 31 31 30 31 30 31)[1+m]
  :If (m=2)∧(IsLeap y)
    R ← 29
  :EndIf
∇

⍝ Jan 1, 1900 was Monday (1=Monday, 0=Sunday)
dow ← 1

⍝ Advance through 1900
:For m :In ⍳12
  dow ← 7|dow + DaysInMonth m 1900
:EndFor

⍝ Count Sundays on 1st from 1901 to 2000
count ← 0
:For y :In 1900+⍳100
  :For m :In ⍳12
    :If dow = 0
      count ← count + 1
    :EndIf
    dow ← 7|dow + DaysInMonth m y
  :EndFor
:EndFor

⎕ ← 'Result: ' , ⍕count
