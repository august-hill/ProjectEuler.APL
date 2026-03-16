⍝ Problem 074: Digit Factorial Chains
⍝ How many chains starting below 1000000 contain exactly 60 non-repeating terms?
⍝ Answer: 402

factorials ← 1 1 2 6 24 120 720 5040 40320 362880

∇ R ← DigitFactSum n;s
  s ← 0
  :While n > 0
    s ← s + factorials[1 + 10|n]
    n ← ⌊n÷10
  :EndWhile
  R ← s
∇

∇ R ← ChainLength start;n;chain;len;found;i
  chain ← ⍬
  n ← start
  :While 1
    ⍝ Check if n is already in chain
    :If n ∊ chain
      R ← ≢chain
      →0
    :EndIf
    chain ← chain , n
    n ← DigitFactSum n
  :EndWhile
∇

count ← 0
:For start :In ⍳999999
  :If 60 = ChainLength start
    count ← count + 1
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕count
