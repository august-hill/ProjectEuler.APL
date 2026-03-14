⍝ Problem 014: Longest Collatz Sequence
⍝ Find starting number under 1000000 with longest Collatz chain.

⍝ Compute Collatz chain length
∇ R ← CollatzLen n
  R ← 1
  :While n ≠ 1
    :If 0 = 2|n
      n ← n÷2
    :Else
      n ← (3×n)+1
    :EndIf
    R ← R + 1
  :EndWhile
∇

⍝ Solution: iterate all starting numbers, track longest
∇ R ← Solve limit;bestN;bestLen;n;len
  bestN ← 1
  bestLen ← 1
  :For n :In ⍳limit-1
    len ← CollatzLen n
    :If len > bestLen
      bestLen ← len
      bestN ← n
    :EndIf
  :EndFor
  R ← bestN
∇

result ← Solve 1000000
⎕ ← 'Result: ' , ⍕result
