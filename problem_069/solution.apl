⍝ Problem 069: Totient Maximum
⍝ Find n <= 1000000 for which n/phi(n) is a maximum.
⍝ Answer: 510510
⍝ n/phi(n) is maximized when n is the product of consecutive primes.

primes ← 2 3 5 7 11 13 17 19 23 29
result ← 1
:For i :In ⍳10
  :If result × primes[i] > 1000000
    →done
  :EndIf
  result ← result × primes[i]
:EndFor
done:

⎕ ← 'Result: ' , ⍕result
