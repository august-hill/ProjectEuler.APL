⍝ Problem 022: Names Scores
⍝ Total of all name scores in the file.

⍝ Read the names file
data ← ⊃⎕FIO[26] 'names.txt'

⍝ Remove quotes and split by comma
data ← (data≠'"')/data
names ← ',' (≠⊆⊢) data

⍝ Sort names alphabetically
names ← names[⍋↑names]

⍝ Name value: sum of letter positions (A=1, B=2, ...)
∇ R ← NameValue name
  R ← +/(⎕UCS name) - 64
∇

⍝ Total score: each name value times its position
result ← +/(⍳≢names) × {NameValue ⍵}¨names
⎕ ← 'Result: ' , ⍕result
