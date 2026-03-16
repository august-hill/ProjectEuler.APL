⍝ Problem 050: Consecutive Prime Sum
⍝ Find prime < 1000000 that is sum of most consecutive primes.
⍝ Answer: 997651

LIMIT ← 1000000
sieve ← LIMIT⍴1
sieve[1] ← 0
:For i :In 1+⍳(⌊LIMIT*0.5)
  :If sieve[i]
    j ← i×i
    :While j ≤ LIMIT
      sieve[j] ← 0
      j ← j + i
    :EndWhile
  :EndIf
:EndFor

primes ← (⍳LIMIT)/⍨sieve
np ← ≢primes

maxLen ← 0
maxSum ← 0

:For i :In ⍳np
  sum ← 0
  :For j :In ⍳(np-i+1)
    sum ← sum + primes[i+j-1]
    :If sum ≥ LIMIT
      →nextI
    :EndIf
    :If (j > maxLen) ∧ (sum ≤ LIMIT) ∧ (sieve[sum])
      maxLen ← j
      maxSum ← sum
    :EndIf
  :EndFor
  nextI:
:EndFor

⎕ ← 'Result: ' , ⍕maxSum
