⍝ Problem 097: Large Non-Mersenne Prime
⍝ Find last 10 digits of 28433 * 2^7830457 + 1.
⍝ Answer: 8739992577

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

power ← ModPow 2 7830457 MOD
result ← MOD | 1 + MOD | 28433 × power
⎕ ← 'Result: ' , ⍕result
