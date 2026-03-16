⍝ Problem 072: Counting Fractions
⍝ How many reduced proper fractions with d <= 1000000?
⍝ Answer: 303963552391
⍝ Total = sum of phi(d) for d = 2 to 1000000.

LIMIT ← 1000001
phi ← ⍳LIMIT
:For i :In 1+⍳(LIMIT-1)
  :If phi[i] = i
    j ← i
    :While j < LIMIT
      phi[j] ← phi[j] - ⌊phi[j] ÷ i
      j ← j + i
    :EndWhile
  :EndIf
:EndFor

total ← +/phi[1+⍳(LIMIT-1)]
total ← total - 1  ⍝ subtract phi[1]=1 since d starts at 2
⎕ ← 'Result: ' , ⍕total
