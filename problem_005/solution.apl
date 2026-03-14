⍝ Problem 005: Smallest Multiple
⍝ Find the smallest positive number divisible by all numbers from 1 to 20.

⍝ Solution: LCM fold over 1..20 (∧ is LCM in APL)
result ← ∧/⍳20
⎕ ← 'Result: ' , ⍕result
