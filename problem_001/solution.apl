⍝ Problem 001: Multiples of 3 or 5
⍝ Find the sum of all multiples of 3 or 5 below 1000.

⍝ Solution
result ← +/((0=3|⍳999)∨0=5|⍳999)/⍳999
⎕ ← 'Result: ' , ⍕result
