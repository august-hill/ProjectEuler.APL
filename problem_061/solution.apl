⍝ Problem 061: Cyclical Figurate Numbers
⍝ Find sum of the only ordered set of six cyclic 4-digit figurate numbers.
⍝ Answer: 28684

⍝ Generate 4-digit figurate numbers for types 3-8
⍝ P(s,n) = n*((s-2)*n-(s-4))/2

∇ R ← GenFigurate s;n;val;result
  result ← ⍬
  :For n :In ⍳200
    val ← n × ((s-2)×n - (s-4)) ÷ 2
    :If val ≥ 10000
      →doneG
    :EndIf
    :If val ≥ 1000
      result ← result , val
    :EndIf
  :EndFor
  doneG:
  R ← result
∇

fig ← ⍬
:For s :In 3+⍳6
  fig ← fig , ⊂GenFigurate s
:EndFor

⍝ DFS search for cycle of length 6
chain ← 6⍴0
usedType ← 6⍴0
result ← 0

∇ R ← Search depth
  :If depth = 6
    :If (100|chain[6]) = ⌊chain[1]÷100
      R ← +/chain
      →0
    :EndIf
    R ← 0
    →0
  :EndIf
  :For t :In ⍳6
    :If usedType[t]
      →nextT
    :EndIf
    usedType[t] ← 1
    vals ← t⌷fig
    :If depth = 0
      :For v :In vals
        :If (100|v) < 10
          →nextV0
        :EndIf
        chain[1] ← v
        r ← Search 1
        :If r > 0
          R ← r ⋄ usedType[t] ← 0 ⋄ →0
        :EndIf
        nextV0:
      :EndFor
    :Else
      needed ← 100|chain[depth]
      :If needed < 10
        usedType[t] ← 0 ⋄ →nextT
      :EndIf
      :For v :In vals
        :If needed = ⌊v÷100
          :If ((100|v) < 10) ∧ (depth < 5)
            →nextV
          :EndIf
          chain[1+depth] ← v
          r ← Search depth+1
          :If r > 0
            R ← r ⋄ usedType[t] ← 0 ⋄ →0
          :EndIf
          nextV:
        :EndIf
      :EndFor
    :EndIf
    usedType[t] ← 0
    nextT:
  :EndFor
  R ← 0
∇

result ← Search 0
⎕ ← 'Result: ' , ⍕result
