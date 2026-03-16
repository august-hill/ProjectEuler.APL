⍝ Problem 088: Product-sum Numbers
⍝ Find sum of all minimal product-sum numbers for 2 <= k <= 12000.
⍝ Answer: 7587457

KMAX ← 12000
LIMIT ← 2 × KMAX

minPS ← (1+KMAX)⍴(LIMIT+1)

∇ Factorize args;product;sum;count;minFactor;k;f;newProduct
  product ← 1⌷args ⋄ sum ← 2⌷args ⋄ count ← 3⌷args ⋄ minFactor ← 4⌷args
  k ← product - sum + count
  :If k ≤ KMAX
    :If product < minPS[1+k]
      minPS[1+k] ← product
    :EndIf
  :EndIf
  :For f :In (minFactor-1)+⍳(LIMIT-minFactor+1)
    newProduct ← product × f
    :If newProduct > LIMIT
      →0
    :EndIf
    Factorize newProduct (sum+f) (count+1) f
  :EndFor
∇

:For f :In 1+⍳(LIMIT-1)
  Factorize f f 1 f
:EndFor

⍝ Collect unique values
vals ← ∪minPS[2+⍳(KMAX-1)]
total ← +/vals
⎕ ← 'Result: ' , ⍕total
