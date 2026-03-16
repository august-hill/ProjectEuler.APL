⍝ Problem 049: Prime Permutations
⍝ Find 4-digit arithmetic sequence of 3 primes that are permutations (not 1487 sequence).
⍝ Answer: 296962999629

LIMIT ← 10000
sieve ← LIMIT⍴1
sieve[1] ← 0
:For i :In 1+⍳(⌊LIMIT*0.5)
  :If sieve[i]
    j ← i×i
    :While j < LIMIT
      sieve[j] ← 0
      j ← j + i
    :EndWhile
  :EndIf
:EndFor

∇ R ← SortedDigits n
  R ← (⍋s)/s←⍕n
∇

∇ R ← ArePermutations args;a;b
  a ← 1⌷args ⋄ b ← 2⌷args
  R ← (SortedDigits a) ≡ (SortedDigits b)
∇

:For p :In 999+⍳9000
  :If (~sieve[p]) ∨ (p=1487)
    →nextP
  :EndIf
  :For q :In (p+1)+⍳(9999-p)
    :If ~sieve[q]
      →nextQ
    :EndIf
    r ← q + q - p
    :If r ≥ 10000
      →nextP
    :EndIf
    :If sieve[r] ∧ (ArePermutations p q) ∧ (ArePermutations q r)
      result ← (⍕p),(⍕q),(⍕r)
      ⎕ ← 'Result: ' , result
      →0
    :EndIf
    nextQ:
  :EndFor
  nextP:
:EndFor
