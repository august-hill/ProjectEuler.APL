⍝ Problem 058: Spiral Primes
⍝ Find side length where ratio of primes on diagonals falls below 10%.
⍝ Answer: 26241

∇ R ← IsPrime n;i
  :If n < 2
    R ← 0 ⋄ →0
  :EndIf
  :If n = 2
    R ← 1 ⋄ →0
  :EndIf
  :If 0 = 2|n
    R ← 0 ⋄ →0
  :EndIf
  i ← 3
  :While i×i ≤ n
    :If 0 = i|n
      R ← 0 ⋄ →0
    :EndIf
    i ← i + 2
  :EndWhile
  R ← 1
∇

primeCount ← 0
totalDiag ← 1

:For n :In ⍳20000
  side ← 2×n + 1
  corner ← side × side
  ⍝ Check 3 corners (skip bottom-right which is side*side = perfect square)
  :For i :In ⍳3
    val ← corner - 2×n×i
    :If IsPrime val
      primeCount ← primeCount + 1
    :EndIf
  :EndFor
  totalDiag ← totalDiag + 4
  :If primeCount×10 < totalDiag
    ⎕ ← 'Result: ' , ⍕side
    →0
  :EndIf
:EndFor
