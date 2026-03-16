⍝ Problem 027: Quadratic Primes
⍝ Find product a×b for n²+an+b producing most consecutive primes.

⍝ Build prime sieve up to 1000000
PLIMIT ← 1000000
sieve ← PLIMIT⍴1
sieve[1] ← 0
:For i :In 1+⍳(⌊PLIMIT*0.5)
  :If sieve[i]
    j ← i×i
    :While j < PLIMIT
      sieve[j] ← 0
      j ← j + i
    :EndWhile
  :EndIf
:EndFor

∇ R ← IsPrime n
  :If (n<2) ∨ (n≥PLIMIT)
    R ← 0
  :Else
    R ← sieve[n]
  :EndIf
∇

maxN ← 0
result ← 0
:For a :In ¯999+⍳1999
  :For b :In ¯1000+⍳2001
    n ← 0
    cont ← 1
    :While cont
      val ← (n×n) + (a×n) + b
      :If (val<2) ∨ (val≥PLIMIT) ∨ (~sieve[val⌈1])
        cont ← 0
      :Else
        n ← n + 1
      :EndIf
    :EndWhile
    :If n > maxN
      maxN ← n
      result ← a × b
    :EndIf
  :EndFor
:EndFor

⎕ ← 'Result: ' , ⍕result
