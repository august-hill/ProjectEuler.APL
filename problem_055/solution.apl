⍝ Problem 055: Lychrel Numbers
⍝ How many Lychrel numbers are there below ten-thousand?
⍝ Answer: 249
⍝ APL handles big integers natively.

∇ R ← Reverse n
  R ← ⍎⊖⍕n
∇

∇ R ← IsPalindrome n;s
  s ← ⍕n
  R ← s ≡ ⊖s
∇

∇ R ← IsLychrel n;i
  R ← 1
  :For i :In ⍳50
    n ← n + Reverse n
    :If IsPalindrome n
      R ← 0
      →0
    :EndIf
  :EndFor
∇

count ← 0
:For n :In ⍳9999
  :If IsLychrel n
    count ← count + 1
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕count
