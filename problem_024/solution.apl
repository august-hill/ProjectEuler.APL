⍝ Problem 024: Lexicographic Permutations
⍝ What is the millionth lexicographic permutation of digits 0-9?

∇ R ← Factorial n
  :If n ≤ 1
    R ← 1
  :Else
    R ← ×/⍳n
  :EndIf
∇

digits ← 0 1 2 3 4 5 6 7 8 9
n ← 999999
result ← 0

:For i :In ⌽1+⍳9
  fact ← Factorial i
  idx ← ⌊n÷fact
  result ← (result×10) + digits[1+idx]
  digits ← ((⍳≢digits)≠1+idx)/digits
  n ← fact|n
:EndFor
result ← (result×10) + digits[1]

⎕ ← 'Result: ' , ⍕result
