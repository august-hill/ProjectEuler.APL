⍝ Problem 031: Coin Sums
⍝ How many ways can 200p be made using coins?

coins ← 1 2 5 10 20 50 100 200
ways ← 201⍴0
ways[1] ← 1

:For c :In coins
  :For amount :In c+⍳(200-c+1)
    ways[1+amount] ← ways[1+amount] + ways[1+amount-c]
  :EndFor
:EndFor

result ← ways[201]
⎕ ← 'Result: ' , ⍕result
