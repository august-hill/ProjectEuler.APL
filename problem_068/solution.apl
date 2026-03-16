⍝ Problem 068: Magic 5-gon Ring
⍝ Find the maximum 16-digit string for a magic 5-gon ring.
⍝ Answer: 6531031914842725
⍝ For 16-digit string, 10 must be on an outer node.
⍝ Try all permutations of 1-10 split into outer[5] and inner[5].

∇ R ← NextPerm d;n;k;l;t
  n ← ≢d
  k ← n - 1
  :While (k > 1) ∧ (d[k-1] ≥ d[k])
    k ← k - 1
  :EndWhile
  :If (k ≤ 1) ∧ (d[1] ≥ d[2])
    R ← ⍬ ⋄ →0
  :EndIf
  k ← k - 1
  l ← n
  :While d[k] ≥ d[l]
    l ← l - 1
  :EndWhile
  t ← d[k] ⋄ d[k] ← d[l] ⋄ d[l] ← t
  d[(k+1)+⍳(n-k)] ← ⊖d[(k+1)+⍳(n-k)]
  R ← d
∇

best ← 0
perm ← ⍳10

:While 1
  outer ← perm[⍳5]
  inner ← perm[5+⍳5]
  target ← outer[1] + inner[1] + inner[2]
  valid ← 1
  :For i :In 1+⍳4
    :If target ≠ outer[1+i] + inner[1+i] + inner[1+(5|1+i)]
      valid ← 0 ⋄ →skipV
    :EndIf
  :EndFor
  skipV:
  :If valid
    ⍝ Find line with smallest outer node
    minIdx ← ⊃⍋outer
    ⍝ Build digit sequence and count total digits
    totalDigits ← 0
    numStr ← ''
    :For k :In ⍳5
      idx ← 1 + 5|minIdx+k-2
      o ← outer[idx]
      i1 ← inner[idx]
      i2 ← inner[1+(5|idx)]
      numStr ← numStr,(⍕o),(⍕i1),(⍕i2)
      totalDigits ← totalDigits + (≢⍕o) + (≢⍕i1) + (≢⍕i2)
    :EndFor
    :If totalDigits = 16
      num ← ⍎numStr
      :If num > best
        best ← num
      :EndIf
    :EndIf
  :EndIf
  perm ← NextPerm perm
  :If 0 = ≢perm
    →doneAll
  :EndIf
:EndWhile
doneAll:

⎕ ← 'Result: ' , ⍕best
