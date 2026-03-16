⍝ Problem 087: Prime Power Triples
⍝ How many numbers below 50000000 can be expressed as p^2 + q^3 + r^4?
⍝ Answer: 1097343

LIMIT ← 50000000
PLIMIT ← ⌈LIMIT*0.5

⍝ Sieve primes
sieve ← PLIMIT⍴1
sieve[1] ← 0
:For i :In 1+⍳(⌊PLIMIT*0.5)
  :If sieve[i]
    j ← i×i
    :While j ≤ PLIMIT
      sieve[j] ← 0
      j ← j + i
    :EndWhile
  :EndIf
:EndFor
primes ← (⍳PLIMIT)/⍨sieve

⍝ Use a seen array - but 50M is too large for APL boolean vector
⍝ Use hash set approach with sorted unique
results ← ⍬

:For ri :In ⍳≢primes
  r ← primes[ri]
  r4 ← r*4
  :If r4 ≥ LIMIT ⋄ →doneR ⋄ :EndIf
  :For qi :In ⍳≢primes
    q ← primes[qi]
    q3 ← q*3
    :If (r4+q3) ≥ LIMIT ⋄ →nextR ⋄ :EndIf
    :For pi :In ⍳≢primes
      p ← primes[pi]
      total ← r4 + q3 + p×p
      :If total ≥ LIMIT ⋄ →nextQ ⋄ :EndIf
      results ← results , total
    :EndFor
    nextQ:
  :EndFor
  nextR:
:EndFor
doneR:

result ← ≢∪results
⎕ ← 'Result: ' , ⍕result
