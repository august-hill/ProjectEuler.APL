⍝ Problem 004: Largest Palindrome Product
⍝ Find the largest palindrome made from the product of two 3-digit numbers.

⍝ Helper: check if number is a palindrome
∇ R ← IsPalindrome n
  s ← ⍕n
  R ← s ≡ ⌽s
∇

⍝ Solution: generate palindromes from largest and check factorability
∇ R ← Solve
  R ← 0
  :For a :In 9 8 7 6 5 4 3 2 1
    :For b :In 9 8 7 6 5 4 3 2 1 0
      :For c :In 9 8 7 6 5 4 3 2 1 0
        pal ← (100001×a) + (10010×b) + (1100×c)
        :For i :In ⌽100+⍳900
          :If (i×i) < pal
            :Leave
          :EndIf
          :If 0 = i|pal
            j ← pal÷i
            :If (j≥100) ∧ (j≤999)
              R ← pal
              →0
            :EndIf
          :EndIf
        :EndFor
      :EndFor
    :EndFor
  :EndFor
∇

result ← Solve
⎕ ← 'Result: ' , ⍕result
