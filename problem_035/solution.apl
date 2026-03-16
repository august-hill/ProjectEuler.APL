⍝ Problem 035: Circular Primes
⍝ How many circular primes are there below one million?

LIMIT ← 1000000

⍝ Build prime sieve
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

∇ R ← Rotate n;d;last;rest;mult
  d ← ≢⍕n
  last ← 10|n
  rest ← ⌊n÷10
  mult ← 10*(d-1)
  R ← (last×mult) + rest
∇

∇ R ← IsCircularPrime n;d;rotated;i
  d ← ≢⍕n
  rotated ← n
  R ← 1
  :For i :In ⍳d
    :If (rotated ≥ LIMIT) ∨ (~sieve[rotated])
      R ← 0
      →0
    :EndIf
    rotated ← Rotate rotated
  :EndFor
∇

count ← 0
:For n :In 1+⍳(LIMIT-2)
  :If sieve[n] ∧ (IsCircularPrime n)
    count ← count + 1
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕count
