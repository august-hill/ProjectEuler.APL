⍝ Problem 048: Self Powers
⍝ Find last 10 digits of 1^1 + 2^2 + 3^3 + ... + 1000^1000.
⍝ Answer: 9110846700
⍝ APL handles big integers natively.

MOD ← 10000000000

∇ R ← ModPow args;base;exp;m;result
  base ← 1⌷args ⋄ exp ← 2⌷args ⋄ m ← 3⌷args
  result ← 1
  base ← m|base
  :While exp > 0
    :If 1 = 2|exp
      result ← m|result×base
    :EndIf
    exp ← ⌊exp÷2
    base ← m|base×base
  :EndWhile
  R ← result
∇

sum ← 0
:For i :In ⍳1000
  sum ← MOD | sum + ModPow i i MOD
:EndFor

⎕ ← 'Result: ' , ⍕sum
