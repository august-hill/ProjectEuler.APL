⍝ Problem 043: Sub-string Divisibility
⍝ Find sum of all 0-9 pandigital numbers with substring divisibility property.
⍝ Answer: 16695334890

⍝ d2d3d4 div by 2, d3d4d5 div by 3, d4d5d6 div by 5, d5d6d7 div by 7,
⍝ d6d7d8 div by 11, d7d8d9 div by 13, d8d9d10 div by 17
divisors ← 2 3 5 7 11 13 17

∇ R ← Perms n;result;i;rest;p;j
  :If n ≤ 1
    R ← 1 1⍴1
    →0
  :EndIf
  rest ← Perms n-1
  R ← (0 n)⍴0
  :For i :In ⍳n
    :For j :In ⍳1⌷⍴rest
      p ← rest[j;]
      p ← (p≥i)/p ⍝ shift up values >= i
      p ← ((p≥i)+ p)
      ⍝ This approach is complex. Use a different strategy.
    :EndFor
  :EndFor
∇

⍝ Use direct enumeration approach
⍝ Generate all permutations of 0-9 and check conditions
sum ← 0
digits ← 0 1 2 3 4 5 6 7 8 9

⍝ Since 10! = 3628800 permutations, iterate with next-permutation approach
∇ R ← NextPerm d;n;k;l;t
  n ← ≢d
  k ← n - 1
  :While (k > 1) ∧ (d[k-1] ≥ d[k])
    k ← k - 1
  :EndWhile
  :If (k ≤ 1) ∧ (d[1] ≥ d[2])
    R ← ⍬
    →0
  :EndIf
  k ← k - 1
  l ← n
  :While d[k] ≥ d[l]
    l ← l - 1
  :EndWhile
  t ← d[k] ⋄ d[k] ← d[l] ⋄ d[l] ← t
  d[(k+1)+⍳(n-k)] ← ⊖d[(k+1)+⍳(n-k)]
  R ← d
∇

⍝ 1-indexed digits array: digits+1 to get values 1-10 representing 0-9
perm ← 1+⍳10  ⍝ will represent digits 0,1,2,...,9 as 1,2,...,10
d ← 0 1 2 3 4 5 6 7 8 9

sum ← 0
count ← 0
:While 1
  ⍝ Check substring divisibility: d[2..4] div 2, d[3..5] div 3, etc.
  valid ← 1
  :For i :In ⍳7
    sub ← d[1+i]×100 + d[2+i]×10 + d[3+i]
    :If 0 ≠ divisors[i] | sub
      valid ← 0
      →skipL
    :EndIf
  :EndFor
  skipL:
  :If valid
    num ← +/ d × 10*⌽⍳10
    sum ← sum + num
  :EndIf
  d ← NextPerm d
  :If 0 = ≢d
    →0
  :EndIf
  count ← count + 1
:EndWhile

⎕ ← 'Result: ' , ⍕sum
