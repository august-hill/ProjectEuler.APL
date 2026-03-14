⍝ Problem 015: Lattice Paths
⍝ Count routes through a 20x20 grid using only right and down moves.

⍝ Solution: C(40,20) = 40! / (20!)²
⍝ APL handles big integers natively
result ← (!40)÷(!20)*2
⎕ ← 'Result: ' , ⍕result
