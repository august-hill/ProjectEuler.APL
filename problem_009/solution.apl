⍝ Problem 009: Special Pythagorean Triplet
⍝ Find a*b*c where a+b+c=1000 and a²+b²=c².

⍝ Solution: derive b algebraically: b = (s² - 2sa) / (2s - 2a)
∇ R ← Solve s;a;num;den;b;c
  R ← 0
  :For a :In ⍳⌊s÷3
    num ← (s×s) - (2×s×a)
    den ← (2×s) - (2×a)
    :If 0 = den|num
      b ← num÷den
      c ← s - a - b
      :If (a<b) ∧ (b<c) ∧ ((a×a)+(b×b)) = c×c
        R ← a×b×c
        →0
      :EndIf
    :EndIf
  :EndFor
∇

result ← Solve 1000
⎕ ← 'Result: ' , ⍕result
