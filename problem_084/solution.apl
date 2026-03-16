⍝ Problem 084: Monopoly Odds
⍝ Using two 4-sided dice, find three most popular squares.
⍝ Answer: 101524
⍝ Uses Markov chain steady-state analysis.

⍝ Square indices
GO ← 0 ⋄ JAIL ← 10 ⋄ G2J ← 30
CC1 ← 2 ⋄ CC2 ← 17 ⋄ CC3 ← 33
CH1 ← 7 ⋄ CH2 ← 22 ⋄ CH3 ← 36
C1 ← 11 ⋄ E3 ← 24 ⋄ H2 ← 39 ⋄ R1 ← 5

⍝ Dice probabilities for 2d4
diceProb ← 9⍴0
:For d1 :In ⍳4
  :For d2 :In ⍳4
    diceProb[d1+d2] ← diceProb[d1+d2] + 1÷16
  :EndFor
:EndFor

freq ← 40⍴0
freq[1+GO] ← 1

⍝ Iterate to steady state
:For iter :In ⍳200
  newFreq ← 40⍴0
  :For pos :In ⍳40
    :If freq[pos] = 0
      →nextPos
    :EndIf
    p ← pos - 1  ⍝ 0-indexed position
    ⍝ 3 consecutive doubles -> jail (prob 1/64)
    newFreq[1+JAIL] ← newFreq[1+JAIL] + freq[pos] × 1÷64
    remaining ← freq[pos] × 63÷64
    :For sum :In 2+⍳7
      next ← 40 | p + sum
      prob ← remaining × diceProb[sum]
      ⍝ Apply landing rules
      :If next = G2J
        newFreq[1+JAIL] ← newFreq[1+JAIL] + prob
      :ElseIf (next=CC1) ∨ (next=CC2) ∨ (next=CC3)
        newFreq[1+GO] ← newFreq[1+GO] + prob÷16
        newFreq[1+JAIL] ← newFreq[1+JAIL] + prob÷16
        newFreq[1+next] ← newFreq[1+next] + prob×14÷16
      :ElseIf (next=CH1) ∨ (next=CH2) ∨ (next=CH3)
        :If next=CH1 ⋄ nextR←15 ⋄ nextU←12 ⋄ :EndIf
        :If next=CH2 ⋄ nextR←25 ⋄ nextU←28 ⋄ :EndIf
        :If next=CH3 ⋄ nextR←5  ⋄ nextU←12 ⋄ :EndIf
        back3 ← 40 | next - 3
        newFreq[1+GO] ← newFreq[1+GO] + prob÷16
        newFreq[1+JAIL] ← newFreq[1+JAIL] + prob÷16
        newFreq[1+C1] ← newFreq[1+C1] + prob÷16
        newFreq[1+E3] ← newFreq[1+E3] + prob÷16
        newFreq[1+H2] ← newFreq[1+H2] + prob÷16
        newFreq[1+R1] ← newFreq[1+R1] + prob÷16
        newFreq[1+nextR] ← newFreq[1+nextR] + prob×2÷16
        newFreq[1+nextU] ← newFreq[1+nextU] + prob÷16
        newFreq[1+back3] ← newFreq[1+back3] + prob÷16
        newFreq[1+next] ← newFreq[1+next] + prob×6÷16
      :Else
        newFreq[1+next] ← newFreq[1+next] + prob
      :EndIf
    :EndFor
    nextPos:
  :EndFor
  freq ← newFreq
:EndFor

⍝ Find top 3
order ← ⍒freq
top3 ← (order[1]-1) (order[2]-1) (order[3]-1)
result ← (10000×top3[1]) + (100×top3[2]) + top3[3]
⎕ ← 'Result: ' , ⍕result
