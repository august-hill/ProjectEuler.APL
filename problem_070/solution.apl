⍝ Problem 070: Totient Permutation
⍝ Find n < 10^7 where phi(n) is a permutation of n and n/phi(n) is minimized.
⍝ Answer: 8319823

LIMIT ← 10000000

⍝ Compute Euler's totient using sieve
phi ← ⍳LIMIT
:For i :In 1+⍳(LIMIT-1)
  :If phi[i] = i
    ⍝ i is prime
    j ← i
    :While j < LIMIT
      phi[j] ← phi[j] - ⌊phi[j] ÷ i
      j ← j + i
    :EndWhile
  :EndIf
:EndFor

∇ R ← SortedDigits n
  R ← (⍋s)/s←⍕n
∇

bestN ← 0
bestRatio ← 1E18

:For n :In 1+⍳(LIMIT-2)
  :If (SortedDigits n) ≡ (SortedDigits phi[n])
    ratio ← n ÷ phi[n]
    :If ratio < bestRatio
      bestRatio ← ratio
      bestN ← n
    :EndIf
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕bestN
