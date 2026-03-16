⍝ Problem 080: Square Root Digital Expansion
⍝ For first 100 natural numbers, find total of digit sums of first 100 decimal
⍝ digits of all irrational square roots.
⍝ Answer: 40886
⍝ APL handles big integers natively. Use digit-by-digit square root method.

∇ R ← IsPerfectSquare n;s
  s ← ⌊n*0.5
  R ← s×s = n
∇

∇ R ← SqrtDigitSum n;pairs;npairs;p;rem;i;x;twentyP;d;trial
  ⍝ Digit-by-digit square root computation using big integers
  ⍝ Start with pairs of digits from n, then 00 pairs for fractional part
  pairs ← ⍬
  :If n < 100
    pairs ← pairs , n
  :Else
    pairs ← pairs , ⌊n÷100
    pairs ← pairs , 100|n
  :EndIf
  ⍝ Pad with zero pairs
  :While 110 > ≢pairs
    pairs ← pairs , 0
  :EndWhile

  p ← 0   ⍝ accumulated result
  rem ← 0 ⍝ remainder
  R ← 0
  digitCount ← 0

  :For i :In ⍳≢pairs
    :If digitCount ≥ 100
      →0
    :EndIf
    rem ← rem×100 + pairs[i]
    ⍝ Find largest x (0-9) such that (20p+x)*x <= rem
    x ← 0
    twentyP ← 20×p
    :For d :In ⌽⍳9
      trial ← (twentyP + d) × d
      :If trial ≤ rem
        x ← d
        rem ← rem - trial
        →foundX
      :EndIf
    :EndFor
    foundX:
    p ← p×10 + x
    R ← R + x
    digitCount ← digitCount + 1
  :EndFor
∇

total ← 0
:For n :In ⍳100
  :If ~IsPerfectSquare n
    total ← total + SqrtDigitSum n
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕total
