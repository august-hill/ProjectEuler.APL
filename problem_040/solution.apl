⍝ Problem 040: Champernowne's Constant
⍝ Find d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000.
⍝ Answer: 210

⍝ Build the fractional digit string by concatenating 1,2,3,...
champernowne ← ''
n ← 0
:While 1000001 > ≢champernowne
  n ← n + 1
  champernowne ← champernowne , ⍕n
:EndWhile

positions ← 1 10 100 1000 10000 100000 1000000
digits ← (⍎¨champernowne[positions])
result ← ×/digits
⎕ ← 'Result: ' , ⍕result
