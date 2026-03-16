⍝ Problem 062: Cubic Permutations
⍝ Find smallest cube for which exactly 5 permutations of its digits are also cubes.
⍝ Answer: 127035954683

⍝ Strategy: for each cube, compute sorted-digit signature.
⍝ Track count and first cube per signature.

∇ R ← SortedDigits n
  R ← (⍋s)/s←⍕n
∇

⍝ Use parallel arrays: sigs, counts, firstCubes
sigs ← ⍬
counts ← ⍬
firstCubes ← ⍬

:For n :In ⍳99999
  cube ← n*3
  sig ← SortedDigits cube
  ⍝ Search for existing signature
  found ← 0
  :For i :In ⍳≢sigs
    :If sig ≡ i⌷sigs
      counts[i] ← counts[i] + 1
      :If counts[i] = 5
        ⎕ ← 'Result: ' , ⍕firstCubes[i]
        →0
      :EndIf
      found ← 1
      →doneSearch
    :EndIf
  :EndFor
  doneSearch:
  :If ~found
    sigs ← sigs , ⊂sig
    counts ← counts , 1
    firstCubes ← firstCubes , cube
  :EndIf
:EndFor
