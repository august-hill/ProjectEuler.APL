⍝ Problem 056: Powerful Digit Sum
⍝ Find maximum digit sum of a^b for a,b < 100.
⍝ Answer: 972
⍝ APL handles big integers natively.

maxSum ← 0
:For a :In 1+⍳98
  :For b :In 1+⍳98
    s ← +/(10⊥⍣¯1) a*b
    :If s > maxSum
      maxSum ← s
    :EndIf
  :EndFor
:EndFor

⎕ ← 'Result: ' , ⍕maxSum
