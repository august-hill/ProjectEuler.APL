⍝ Problem 016: Power Digit Sum
⍝ What is the sum of the digits of 2*1000?

⍝ Solution: APL handles big integers natively
result ← +/⍎¨⍕2*1000
⎕ ← 'Result: ' , ⍕result
