⍝ Problem 032: Pandigital Products
⍝ Sum of all products in pandigital multiplicand/multiplier/product identities.

∇ R ← IsPandigital args;a;b;c;s;digits;d
  a ← 1⌷args ⋄ b ← 2⌷args ⋄ c ← 3⌷args
  s ← (⍕a),(⍕b),(⍕c)
  :If 9 ≠ ≢s
    R ← 0
    →0
  :EndIf
  digits ← 10⍴0
  R ← 1
  :For d :In s
    :If (d='0') ∨ (digits[(⎕UCS d)-47] = 1)
      R ← 0
      →0
    :EndIf
    digits[(⎕UCS d)-47] ← 1
  :EndFor
∇

products ← (0⍴0)
:For a :In ⍳99
  :If a < 10
    start ← 1000 ⋄ end ← 9999
  :Else
    start ← 100 ⋄ end ← 999
  :EndIf
  :For b :In (start-1)+⍳(end-start+1)
    c ← a × b
    :If IsPandigital a b c
      :If ~c∊products
        products ← products , c
      :EndIf
    :EndIf
  :EndFor
:EndFor

result ← +/products
⎕ ← 'Result: ' , ⍕result
