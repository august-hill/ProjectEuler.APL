⍝ Problem 047: Distinct Prime Factors
⍝ Find first of 4 consecutive integers each with 4 distinct prime factors.
⍝ Answer: 134043

LIMIT ← 150000

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

primes ← (⍳LIMIT)/⍨sieve

∇ R ← CountPF n;count;p;i
  count ← 0
  :For i :In ⍳≢primes
    p ← primes[i]
    :If p×p > n
      →doneF
    :EndIf
    :If 0 = p|n
      count ← count + 1
      :While 0 = p|n
        n ← n÷p
      :EndWhile
    :EndIf
  :EndFor
  doneF:
  :If n > 1
    count ← count + 1
  :EndIf
  R ← count
∇

consec ← 0
:For i :In 1+⍳(LIMIT-1)
  :If 4 = CountPF i
    consec ← consec + 1
    :If consec = 4
      ⎕ ← 'Result: ' , ⍕i-3
      →0
    :EndIf
  :Else
    consec ← 0
  :EndIf
:EndFor
