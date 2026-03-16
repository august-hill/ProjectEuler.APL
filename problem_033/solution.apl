⍝ Problem 033: Digit Cancelling Fractions
⍝ Denominator of product of the four curious fractions in lowest terms.

∇ R ← GCD args;a;b;t
  a ← 1⌷args ⋄ b ← 2⌷args
  :While b ≠ 0
    t ← b
    b ← a - b × ⌊a÷b
    a ← t
  :EndWhile
  R ← a
∇

np ← 1
dp ← 1
:For a :In ⍳9
  :For b :In ⍳9
    :For c :In ⍳9
      :For d :In ⍳9
        num ← (a×10) + b
        den ← (c×10) + d
        :If num ≥ den
          →skip
        :EndIf
        ⍝ If b=c, check if a/d = num/den
        :If (b=c) ∧ (a×den = num×d)
          np ← np × num
          dp ← dp × den
        :EndIf
        skip:
      :EndFor
    :EndFor
  :EndFor
:EndFor

result ← dp ÷ GCD np dp
⎕ ← 'Result: ' , ⍕result
