⍝ Problem 036: Double-base Palindromes
⍝ Sum of numbers < 1000000 palindromic in both base 10 and base 2.

∇ R ← IsPalindrome s
  R ← s ≡ ⌽s
∇

∇ R ← ToBinary n;bits
  bits ← (0⍴0)
  :While n > 0
    bits ← bits , 2|n
    n ← ⌊n÷2
  :EndWhile
  R ← ⌽bits
∇

sum ← 0
:For n :In ⍳999999
  :If (IsPalindrome ⍕n) ∧ (IsPalindrome ToBinary n)
    sum ← sum + n
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕sum
