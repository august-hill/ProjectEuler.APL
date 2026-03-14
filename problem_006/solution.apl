⍝ Problem 006: Sum Square Difference
⍝ Difference between square of sum and sum of squares for first 100 natural numbers.

⍝ Solution
result ← ((+/⍳100)*2) - +/(⍳100)*2
⎕ ← 'Result: ' , ⍕result
