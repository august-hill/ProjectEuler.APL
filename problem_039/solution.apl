⍝ Problem 039: Integer Right Triangles
⍝ For which p <= 1000 is the number of right triangle solutions maximised?
⍝ Answer: 840

solutions ← 1001⍴0
:For a :In ⍳333
  :For b :In a+⍳(499-a)
    cs ← (a×a) + b×b
    c ← ⌊cs*0.5
    :If c×c = cs
      p ← a + b + c
      :If p ≤ 1000
        solutions[1+p] ← solutions[1+p] + 1
      :EndIf
    :EndIf
  :EndFor
:EndFor

result ← ¯1+⊃⍒solutions
⎕ ← 'Result: ' , ⍕result
