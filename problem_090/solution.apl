⍝ Problem 090: Cube Digit Pairs
⍝ How many distinct arrangements of two cubes allow all square numbers to be displayed?
⍝ Answer: 1217

⍝ Generate all C(10,6)=210 possible dice
dice ← ⍬
:For a :In ⍳5
  :For b :In (a+1)+⍳(10-a-5)
    :For c :In (b+1)+⍳(10-b-4)
      :For d :In (c+1)+⍳(10-c-3)
        :For e :In (d+1)+⍳(10-d-2)
          :For f :In (e+1)+⍳(10-e-1)
            die ← (a-1)(b-1)(c-1)(d-1)(e-1)(f-1)
            ⍝ 6 and 9 interchangeable
            :If (6∊die) ∨ (9∊die)
              die ← ∪die,6,9
            :EndIf
            dice ← dice , ⊂die
          :EndFor
        :EndFor
      :EndFor
    :EndFor
  :EndFor
:EndFor

⍝ Square digit pairs: 01,04,09,16,25,36,49,64,81
squares ← 9 2⍴0 1 0 4 0 9 1 6 2 5 3 6 4 9 6 4 8 1

nDice ← ≢dice
count ← 0

:For i :In ⍳nDice
  :For j :In i+⍳(nDice-i+1)
    d1 ← i⌷dice
    d2 ← (i+j-1)⌷dice
    valid ← 1
    :For s :In ⍳9
      a ← squares[s;1] ⋄ b ← squares[s;2]
      :If ~((a∊d1) ∧ (b∊d2)) ∨ ((b∊d1) ∧ (a∊d2))
        valid ← 0
        →nextJ
      :EndIf
    :EndFor
    nextJ:
    :If valid
      count ← count + 1
    :EndIf
  :EndFor
:EndFor

⎕ ← 'Result: ' , ⍕count
