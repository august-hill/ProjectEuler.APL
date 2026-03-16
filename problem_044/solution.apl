⍝ Problem 044: Pentagon Numbers
⍝ Find pair of pentagonal numbers where sum and difference are both pentagonal.
⍝ Answer: 5482660

∇ R ← Pent n
  R ← n × (3×n - 1) ÷ 2
∇

∇ R ← IsPent n;t
  ⍝ n = k(3k-1)/2 => k = (1+sqrt(1+24n))/6
  t ← (1 + (1+24×n)*0.5) ÷ 6
  R ← t = ⌊t
∇

result ← 0
:For j :In 1+⍳2999
  :For k :In (j+1)+⍳(2999-j)
    pj ← Pent j
    pk ← Pent k
    :If (IsPent pk+pj) ∧ (IsPent pk-pj)
      result ← pk - pj
      →done
    :EndIf
  :EndFor
:EndFor
done:

⎕ ← 'Result: ' , ⍕result
