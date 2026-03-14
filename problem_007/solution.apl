⍝ Problem 007: 10001st Prime
⍝ Find the 10001st prime number.

⍝ Solution: trial division collecting primes
∇ R ← NthPrime n
  primes ← ,2
  candidate ← 3
  :While n > ⍴primes
    sqrtc ← ⌊candidate*0.5
    isprime ← 1
    :For p :In primes
      :If p > sqrtc
        :Leave
      :EndIf
      :If 0 = p|candidate
        isprime ← 0
        :Leave
      :EndIf
    :EndFor
    :If isprime
      primes ← primes,candidate
    :EndIf
    candidate ← candidate + 2
  :EndWhile
  R ← primes[n]
∇

result ← NthPrime 10001
⎕ ← 'Result: ' , ⍕result
