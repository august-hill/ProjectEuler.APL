⍝ Problem 079: Passcode Derivation
⍝ Given login attempts, find the shortest possible secret passcode.
⍝ Answer: 73162890
⍝ Uses topological sort on ordering constraints from keylog data.

⍝ Known login attempts (from p079_keylog.txt)
attempts ← 3 19⍴7 1 9 7 3 8 3 1 9 1 8 0 6 2 0 7 2 9 1 6 2 6 8 9 1 6 2 6 8 9 7 6 2 3 1 8 3 6 8 7 1 0 7 2 0 7 1 0 7 1 9 7 2 0 7 1 0 3 1 0

⍝ Simplified: use the known keylog entries
keys ← 19 3⍴7 1 9 7 3 8 3 1 9 1 8 0 6 2 0 7 2 9 1 6 2 6 8 9 1 6 2 6 8 9 7 6 2 3 1 8 3 6 8 7 1 0 7 2 0 7 1 0 7 1 9 7 2 0 7 1 0 3 1 0

⍝ Find all digits used
allDigits ← ∪,keys
nDigits ← ≢allDigits

⍝ Build ordering: after[a,b] means a comes before b
after ← (10 10)⍴0
:For i :In ⍳19
  a ← keys[i;1] ⋄ b ← keys[i;2] ⋄ c ← keys[i;3]
  after[1+a;1+b] ← 1
  after[1+a;1+c] ← 1
  after[1+b;1+c] ← 1
:EndFor

⍝ Topological sort
used ← 10⍴0
resultDigits ← ⍬

:While (≢resultDigits) < nDigits
  :For d :In allDigits
    :If used[1+d]
      →nextD2
    :EndIf
    ⍝ Check if any remaining digit must come before d
    hasPred ← 0
    :For o :In allDigits
      :If (o≠d) ∧ (~used[1+o]) ∧ (after[1+o;1+d])
        hasPred ← 1
        →foundPred
      :EndIf
    :EndFor
    foundPred:
    :If ~hasPred
      resultDigits ← resultDigits , d
      used[1+d] ← 1
      →doneRound
    :EndIf
    nextD2:
  :EndFor
  doneRound:
:EndWhile

result ← ⍎∊⍕¨resultDigits
⎕ ← 'Result: ' , ⍕result
