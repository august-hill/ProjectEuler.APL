⍝ Problem 037: Truncatable Primes
⍝ Sum of the 11 primes that are both left and right truncatable.

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

∇ R ← IsPrime n
  :If (n<2) ∨ (n≥LIMIT)
    R ← 0
  :Else
    R ← sieve[n]
  :EndIf
∇

∇ R ← IsLeftTrunc n;divisor;t
  divisor ← 1
  t ← n
  :While divisor ≤ t
    divisor ← divisor × 10
  :EndWhile
  divisor ← divisor ÷ 10
  :While divisor > 1
    n ← divisor|n
    :If (n=0) ∨ (~IsPrime n)
      R ← 0
      →0
    :EndIf
    divisor ← divisor ÷ 10
  :EndWhile
  R ← 1
∇

∇ R ← IsRightTrunc n
  n ← ⌊n÷10
  :While n > 0
    :If ~IsPrime n
      R ← 0
      →0
    :EndIf
    n ← ⌊n÷10
  :EndWhile
  R ← 1
∇

sum ← 0
count ← 0
p ← 10
:While count < 11
  p ← p + 1
  :If p ≥ LIMIT
    →done
  :EndIf
  :If (IsPrime p) ∧ (IsLeftTrunc p) ∧ (IsRightTrunc p)
    sum ← sum + p
    count ← count + 1
  :EndIf
:EndWhile
done:

⎕ ← 'Result: ' , ⍕sum
