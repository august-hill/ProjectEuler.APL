⍝ Problem 046: Goldbach's Other Conjecture
⍝ Find smallest odd composite that cannot be written as prime + 2*square.
⍝ Answer: 5777

LIMIT ← 10000
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

result ← 0
:For c :In 9,11+2×⍳((LIMIT-11)÷2)
  :If sieve[c]
    →nextC
  :EndIf
  found ← 0
  :For p :In 1+⍳(c-1)
    :If sieve[p]
      :For y :In ⍳(⌊(c÷2)*0.5)
        :If c = p + 2×y×y
          found ← 1
          →doneInner
        :EndIf
      :EndFor
    :EndIf
  :EndFor
  doneInner:
  :If ~found
    result ← c
    →done
  :EndIf
  nextC:
:EndFor
done:

⎕ ← 'Result: ' , ⍕result
