⍝ Problem 038: Pandigital Multiples
⍝ Find largest 1-9 pandigital formed as concatenated product of n with (1,2,...,k), k>1.
⍝ Answer: 932718654

∇ R ← IsPandigital19 s
  R ← (9=≢s) ∧ (9=≢∪s) ∧ (~'0'∊s)
∇

largest ← 0
:For n :In ⍳9999
  concat ← ⍕n
  k ← 1
  :While 9 > ≢concat
    k ← k + 1
    concat ← concat , ⍕n×k
  :EndWhile
  :If (k>1) ∧ (IsPandigital19 concat)
    val ← ⍎concat
    :If val > largest
      largest ← val
    :EndIf
  :EndIf
:EndFor

⎕ ← 'Result: ' , ⍕largest
