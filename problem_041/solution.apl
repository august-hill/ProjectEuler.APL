⍝ Problem 041: Pandigital Prime
⍝ Find the largest n-digit pandigital prime.
⍝ Answer: 7652413
⍝ Note: 8 and 9 digit pandigitals have digit sums 36 and 45 (divisible by 3),
⍝ so we only need to check 7-digit pandigitals.

LIMIT ← 7654321

⍝ Build prime sieve
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

∇ R ← IsPandigital n;s;k;digits
  s ← ⍕n
  k ← ≢s
  R ← (k = ≢∪s) ∧ (∧/(⍳k)∊(⍎¨s))
∇

result ← 0
:For n :In ⌽⍳LIMIT
  :If sieve[n] ∧ (IsPandigital n)
    result ← n
    →0
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕result
