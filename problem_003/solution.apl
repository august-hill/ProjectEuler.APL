⍝ Problem 003: Largest Prime Factor
⍝ Find the largest prime factor of 600851475143.

⍝ Solution: trial division
∇ R ← LargestPrimeFactor n
  R ← 1
  ⍝ Remove factors of 2
  :While 0 = 2|n
    R ← 2
    n ← n÷2
  :EndWhile
  ⍝ Remove factors of 3
  :While 0 = 3|n
    R ← 3
    n ← n÷3
  :EndWhile
  ⍝ Check factors of form 6k-1 and 6k+1
  i ← 5
  :While (i×i) ≤ n
    :While 0 = i|n
      R ← i
      n ← n÷i
    :EndWhile
    :While 0 = (i+2)|n
      R ← i+2
      n ← n÷(i+2)
    :EndWhile
    i ← i + 6
  :EndWhile
  ⍝ If n > 1, it is a prime factor
  :If n > 1
    R ← n
  :EndIf
∇

result ← LargestPrimeFactor 600851475143
⎕ ← 'Result: ' , ⍕result
