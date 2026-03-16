⍝ Problem 020: Factorial Digit Sum
⍝ Find the sum of the digits in 100!

⍝ APL handles big integers natively
result ← +/(10⊥⍣¯1)×/⍳100
⎕ ← 'Result: ' , ⍕result
