⍝ Problem 100: Arranged Probability
⍝ Find number of blue discs for first arrangement with over 10^12 discs
⍝ where P(two blue) = 1/2.
⍝ Answer: 756872327473
⍝ Recurrence: b' = 3b + 2n - 2, n' = 4b + 3n - 3

limit ← 1000000000000
b ← 15
n ← 21

:While n ≤ limit
  newB ← (3×b) + (2×n) - 2
  newN ← (4×b) + (3×n) - 3
  b ← newB
  n ← newN
:EndWhile

⎕ ← 'Result: ' , ⍕b
