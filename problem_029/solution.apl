⍝ Problem 029: Distinct Powers
⍝ Count distinct terms in a*b for 2≤a≤100, 2≤b≤100.

⍝ APL handles big integers natively
⍝ Generate all a*b, flatten, remove duplicates, count
bases ← 1+⍳99
exps ← 1+⍳99
all ← ,bases ∘.* exps
result ← ≢∪all
⎕ ← 'Result: ' , ⍕result
