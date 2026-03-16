⍝ Problem 023: Non-abundant Sums
⍝ Find the sum of all positive integers which cannot be written
⍝ as the sum of two abundant numbers.

∇ R ← SumDivisors n;i;s;lim
  :If n ≤ 1
    R ← 0
    →0
  :EndIf
  s ← 1
  lim ← ⌊n*0.5
  :For i :In 1+⍳(lim-1)
    :If 0 = i|n
      s ← s + i
      :If i ≠ n÷i
        s ← s + n÷i
      :EndIf
    :EndIf
  :EndFor
  R ← s
∇

LIMIT ← 28123

⍝ Find all abundant numbers
abundants ← (0⍴0)
:For i :In 11+⍳(LIMIT-11)
  :If (SumDivisors i) > i
    abundants ← abundants , i
  :EndIf
:EndFor

⍝ Mark numbers expressible as sum of two abundant numbers
expressible ← LIMIT⍴0
na ← ≢abundants
:For i :In ⍳na
  :For j :In i+¯1+⍳(na-i+1)
    s ← abundants[i] + abundants[j]
    :If s > LIMIT
      →skip
    :EndIf
    expressible[s] ← 1
  :EndFor
  skip:
:EndFor

⍝ Sum all numbers that cannot be expressed
result ← +/(~expressible)/⍳LIMIT
⎕ ← 'Result: ' , ⍕result
