⍝ Problem 092: Square Digit Chains
⍝ How many starting numbers below 10 million arrive at 89?
⍝ Answer: 8581146

∇ R ← SquareDigitSum n;s
  s ← 0
  :While n > 0
    d ← 10|n
    s ← s + d×d
    n ← ⌊n÷10
  :EndWhile
  R ← s
∇

⍝ Cache for small numbers (max square digit sum for 7 digits = 567)
cache ← 568⍴0

count ← 0
:For n :In ⍳9999999
  chain ← n
  :While 1
    :If chain = 1
      →doneChain
    :EndIf
    :If chain = 89
      count ← count + 1
      →doneChain
    :EndIf
    :If (chain < 568) ∧ (cache[chain] ≠ 0)
      :If cache[chain] = 89
        count ← count + 1
      :EndIf
      →doneChain
    :EndIf
    chain ← SquareDigitSum chain
  :EndWhile
  doneChain:
  :If n < 568
    :If (chain=1) ∨ ((chain<568) ∧ (cache[chain]=1))
      cache[n] ← 1
    :Else
      cache[n] ← 89
    :EndIf
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕count
