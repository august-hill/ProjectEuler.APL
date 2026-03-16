⍝ Problem 060: Prime Pair Sets
⍝ Find lowest sum of 5 primes where any two concatenate to produce a prime.
⍝ Answer: 26033

∇ R ← IsPrime n;i
  :If n < 2
    R ← 0 ⋄ →0
  :EndIf
  :If n < 4
    R ← 1 ⋄ →0
  :EndIf
  :If 0 = 2|n
    R ← 0 ⋄ →0
  :EndIf
  i ← 3
  :While i×i ≤ n
    :If 0 = i|n
      R ← 0 ⋄ →0
    :EndIf
    i ← i + 2
  :EndWhile
  R ← 1
∇

∇ R ← Concat args;a;b
  a ← 1⌷args ⋄ b ← 2⌷args
  R ← ⍎(⍕a),⍕b
∇

∇ R ← IsPair args;a;b
  a ← 1⌷args ⋄ b ← 2⌷args
  R ← (IsPrime Concat a b) ∧ (IsPrime Concat b a)
∇

⍝ Build primes up to 10000
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
primes ← (⍳LIMIT)/⍨sieve
np ← ≢primes

best ← 1000000000

:For ai :In ⍳np
  a ← primes[ai]
  :If a×5 ≥ best ⋄ →done ⋄ :EndIf
  :For bi :In (ai+1)+⍳(np-ai)
    b ← primes[bi]
    :If (a+b)×5÷2 ≥ best ⋄ →nextB ⋄ :EndIf
    :If ~IsPair a b ⋄ →nextB ⋄ :EndIf
    :For ci :In (bi+1)+⍳(np-bi)
      c ← primes[ci]
      :If (a+b+c)×5÷3 ≥ best ⋄ →nextA ⋄ :EndIf
      :If (~IsPair a c) ∨ (~IsPair b c) ⋄ →nextC ⋄ :EndIf
      :For di :In (ci+1)+⍳(np-ci)
        d ← primes[di]
        :If (a+b+c+d) ≥ best ⋄ →nextC ⋄ :EndIf
        :If (~IsPair a d) ∨ (~IsPair b d) ∨ (~IsPair c d) ⋄ →nextD ⋄ :EndIf
        :For ei :In (di+1)+⍳(np-di)
          e ← primes[ei]
          sum ← a+b+c+d+e
          :If sum ≥ best ⋄ →nextD ⋄ :EndIf
          :If (~IsPair a e) ∨ (~IsPair b e) ∨ (~IsPair c e) ∨ (~IsPair d e)
            →nextE
          :EndIf
          best ← sum
          nextE:
        :EndFor
        nextD:
      :EndFor
      nextC:
    :EndFor
    nextB:
  :EndFor
  nextA:
:EndFor
done:

⎕ ← 'Result: ' , ⍕best
