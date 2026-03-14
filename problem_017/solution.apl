⍝ Problem 017: Number Letter Counts
⍝ Count letters used writing 1-1000 in British English.

⍝ Letter counts for words
⍝ ones: "" one two three four five six seven eight nine
ones ← 0 3 3 5 4 4 3 5 5 4
⍝ teens: ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
teens ← 3 6 6 8 8 7 7 9 8 8
⍝ tens: "" "" twenty thirty forty fifty sixty seventy eighty ninety
tens ← 0 0 6 6 5 5 5 7 6 6

∇ R ← LetterCount n;count;rem
  :If n = 1000
    R ← 3 + 8  ⍝ "one" + "thousand"
    →0
  :EndIf
  count ← 0
  ⍝ Hundreds place
  :If n ≥ 100
    count ← count + ones[1+⌊n÷100] + 7  ⍝ ones[digit] + "hundred"
    rem ← 100|n
    :If rem > 0
      count ← count + 3  ⍝ "and"
    :EndIf
    n ← rem
  :EndIf
  ⍝ Tens and ones
  :If n ≥ 20
    count ← count + tens[1+⌊n÷10]
    count ← count + ones[1+10|n]
  :ElseIf n ≥ 10
    count ← count + teens[1+n-10]
  :Else
    count ← count + ones[1+n]
  :EndIf
  R ← count
∇

result ← +/{LetterCount ⍵}¨⍳1000
⎕ ← 'Result: ' , ⍕result
