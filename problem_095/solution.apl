⍝ Problem 095: Amicable Chains
⍝ Find smallest member of longest amicable chain with elements <= 1000000.
⍝ Answer: 14316

LIMIT ← 1000001

⍝ Compute sum of proper divisors
sumDiv ← LIMIT⍴1
sumDiv[1] ← 0
sumDiv[2] ← 0

:For i :In 1+⍳(LIMIT-2)
  j ← 2×i
  :While j < LIMIT
    sumDiv[j] ← sumDiv[j] + i
    j ← j + i
  :EndWhile
:EndFor

visited ← LIMIT⍴0
bestLen ← 0
bestMin ← 0

:For start :In 1+⍳(LIMIT-2)
  :If visited[start]
    →nextStart
  :EndIf
  chain ← ⍬
  inChain ← LIMIT⍴0
  n ← start
  :While (n>0) ∧ (n<LIMIT) ∧ (~inChain[n])
    inChain[n] ← 1
    chain ← chain , n
    n ← sumDiv[n]
  :EndWhile
  ⍝ Check for cycle
  :If (n>0) ∧ (n<LIMIT) ∧ (inChain[n])
    cycleStart ← ⊃(chain=n)/⍳≢chain
    cycleLen ← (≢chain) - cycleStart + 1
    :If cycleLen > bestLen
      bestLen ← cycleLen
      bestMin ← ⌊/chain[cycleStart+⍳cycleLen]
    :EndIf
  :EndIf
  :For v :In chain
    :If v < LIMIT
      visited[v] ← 1
    :EndIf
  :EndFor
  nextStart:
:EndFor

⎕ ← 'Result: ' , ⍕bestMin
