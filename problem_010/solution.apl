⍝ Problem 010: Summation of Primes
⍝ Find the sum of all primes below two million.

⍝ Solution: Sieve of Eratosthenes
∇ R ← SumPrimesBelow n;sieve;i
  sieve ← n⍴1
  sieve[1] ← 0
  i ← 2
  :While (i×i) < n
    :If sieve[i]
      sieve[i×i+((⌊(n-i×i)÷i)+1)×i-i×i+⍳⌊(n-i×i)÷i] ← 0
    :EndIf
    i ← i + 1
  :EndWhile
  R ← +/sieve/⍳n
∇

⍝ Simpler sieve approach
∇ R ← Solve n;sieve;i;j
  sieve ← (n-1)⍴1
  ⍝ sieve[k] represents k+1, so sieve[1]=represents 2
  i ← 2
  :While (i×i) < n
    :If sieve[i-1]
      j ← i×i
      :While j < n
        sieve[j-1] ← 0
        j ← j + i
      :EndWhile
    :EndIf
    i ← i + 1
  :EndWhile
  R ← +/sieve/(1+⍳n-1)
∇

result ← Solve 2000000
⎕ ← 'Result: ' , ⍕result
