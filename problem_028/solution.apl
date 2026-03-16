⍝ Problem 028: Number Spiral Diagonals
⍝ Sum of diagonals in a 1001×1001 spiral.

⍝ Center is 1, then for each odd n from 3 to 1001:
⍝ sum of 4 corners = 4n² - 6(n-1)
odds ← 1+2×⍳500
result ← 1 + +/(4×odds×odds) - 6×odds-1
⎕ ← 'Result: ' , ⍕result
