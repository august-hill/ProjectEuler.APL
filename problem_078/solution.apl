⍝ Problem 078: Coin Partitions
⍝ Find least n for which p(n) is divisible by 1000000.
⍝ Answer: 55374
⍝ Uses Euler's pentagonal number theorem.

LIMIT ← 100000
MODULUS ← 1000000

⍝ Precompute generalized pentagonal numbers
pents ← ⍬
:For k :In ⍳499
  pents ← pents , k × (3×k - 1) ÷ 2
  pents ← pents , k × (3×k + 1) ÷ 2
:EndFor

p ← LIMIT⍴0
p[1] ← 1  ⍝ p(0) = 1 stored at index 1

:For n :In ⍳(LIMIT-1)
  sum ← 0
  :For i :In ⍳≢pents
    :If pents[i] > n
      →donePent
    :EndIf
    ⍝ Sign pattern: +,+,-,-,+,+,-,-,...
    sign ← 1 - 2 × (i > 2) ∧ (i ≤ 4)
    :If i > 4
      sign ← 1 - 2 × ((⌊(i-1)÷2) > 0) ∧ (1 = 2|⌊(i-1)÷2)
    :EndIf
    ⍝ Simpler: sign based on (i-1)÷2 group
    group ← ⌊(i-1)÷2
    sign ← (1 ¯1)[1 + 2|group]
    sum ← MODULUS | sum + sign × p[1+n-pents[i]]
  :EndFor
  donePent:
  p[1+n] ← MODULUS | (MODULUS + sum)
  :If 0 = p[1+n]
    ⎕ ← 'Result: ' , ⍕n
    →0
  :EndIf
:EndFor
