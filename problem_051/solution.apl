⍝ Problem 051: Prime Digit Replacements
⍝ Find smallest prime where replacing 3 same digits gives 8 primes.
⍝ Answer: 121313

UPPER ← 999999
LOWER ← 99999
sieve ← UPPER⍴1
sieve[1] ← 0
:For i :In 1+⍳(⌊UPPER*0.5)
  :If sieve[i]
    j ← i×i
    :While j ≤ UPPER
      sieve[j] ← 0
      j ← j + i
    :EndWhile
  :EndIf
:EndFor

:For p :In (LOWER+1)+⍳(UPPER-LOWER)
  :If ~sieve[p]
    →nextP
  :EndIf
  s ← ⍕p
  n ← ≢s
  ⍝ Try all triples of positions
  :For i :In ⍳(n-2)
    :For j :In (i+1)+⍳(n-i-2)
      :For k :In (j+1)+⍳(n-j-1)
        :If ~(s[i]=s[j]) ∧ (s[j]=s[k])
          →nextK
        :EndIf
        pcount ← 0
        firstPrime ← 0
        :For d :In '0123456789'
          tmp ← s
          tmp[i] ← d ⋄ tmp[j] ← d ⋄ tmp[k] ← d
          num ← ⍎tmp
          :If (num > LOWER) ∧ (sieve[num])
            pcount ← pcount + 1
            :If firstPrime = 0
              firstPrime ← num
            :EndIf
          :EndIf
        :EndFor
        :If pcount = 8
          ⎕ ← 'Result: ' , ⍕firstPrime
          →0
        :EndIf
        nextK:
      :EndFor
    :EndFor
  :EndFor
  nextP:
:EndFor
