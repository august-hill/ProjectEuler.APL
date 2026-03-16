⍝ Problem 077: Prime Summations
⍝ First value writable as sum of primes in over 5000 ways.
⍝ Answer: 71

⍝ Sieve for primes up to 1000
SLIMIT ← 1000
sieve ← SLIMIT⍴1
sieve[1] ← 0
:For i :In 1+⍳(⌊SLIMIT*0.5)
  :If sieve[i]
    j ← i×i
    :While j ≤ SLIMIT
      sieve[j] ← 0
      j ← j + i
    :EndWhile
  :EndIf
:EndFor
primes ← (⍳SLIMIT)/⍨sieve

:For target :In 1+⍳(SLIMIT-1)
  dp ← (1+target)⍴0
  dp[1] ← 1
  :For p :In primes
    :If p > target
      →doneDP
    :EndIf
    :For i :In p+⍳(target-p+1)
      dp[1+i] ← dp[1+i] + dp[1+i-p]
    :EndFor
  :EndFor
  doneDP:
  :If dp[1+target] > 5000
    ⎕ ← 'Result: ' , ⍕target
    →0
  :EndIf
:EndFor
