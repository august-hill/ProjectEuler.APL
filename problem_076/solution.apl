⍝ Problem 076: Counting Summations
⍝ How many ways can 100 be written as sum of at least two positive integers?
⍝ Answer: 190569291

target ← 100
dp ← (1+target)⍴0
dp[1] ← 1

:For part :In ⍳(target-1)
  :For i :In part+⍳(target-part+1)
    dp[1+i] ← dp[1+i] + dp[1+i-part]
  :EndFor
:EndFor

⎕ ← 'Result: ' , ⍕dp[1+target]
