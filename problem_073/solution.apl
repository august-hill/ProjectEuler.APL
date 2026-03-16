⍝ Problem 073: Counting Fractions in a Range
⍝ How many fractions between 1/3 and 1/2 with d <= 12000?
⍝ Answer: 7295372

∇ R ← GCD args;a;b;t
  a ← 1⌷args ⋄ b ← 2⌷args
  :While b ≠ 0
    t ← b
    b ← a - b × ⌊a÷b
    a ← t
  :EndWhile
  R ← a
∇

count ← 0
:For d :In 1+⍳11999
  nMin ← 1 + ⌊d÷3
  :If 0 = 2|d
    nMax ← (d÷2) - 1
  :Else
    nMax ← ⌊d÷2
  :EndIf
  :For n :In (nMin-1)+⍳(nMax-nMin+1)
    :If 1 = GCD n d
      count ← count + 1
    :EndIf
  :EndFor
:EndFor

⎕ ← 'Result: ' , ⍕count
