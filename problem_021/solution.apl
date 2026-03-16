⍝ Problem 021: Amicable Numbers
⍝ Sum of all amicable numbers under 10000.

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

sum ← 0
:For a :In 1+⍳9998
  b ← SumDivisors a
  :If (b≠a) ∧ (b>0) ∧ (b<10000)
    :If a = SumDivisors b
      sum ← sum + a
    :EndIf
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕sum
