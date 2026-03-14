⍝ Problem 012: Highly Divisible Triangular Number
⍝ Find the first triangle number with over 500 divisors.

⍝ Count divisors of n
∇ R ← CountDivisors n;sqrtn;i
  R ← 0
  sqrtn ← ⌊n*0.5
  :For i :In ⍳sqrtn
    :If 0 = i|n
      :If i×i = n
        R ← R + 1
      :Else
        R ← R + 2
      :EndIf
    :EndIf
  :EndFor
∇

⍝ Solution: iterate triangle numbers
∇ R ← Solve;n;tri
  n ← 1
  :While 1
    tri ← n×(n+1)÷2
    :If 500 < CountDivisors tri
      R ← tri
      →0
    :EndIf
    n ← n + 1
  :EndWhile
∇

result ← Solve
⎕ ← 'Result: ' , ⍕result
