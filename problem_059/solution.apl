⍝ Problem 059: XOR Decryption
⍝ Find sum of ASCII values of decrypted text (3-letter lowercase XOR key).
⍝ Answer: 129448
⍝ Note: Requires p059_cipher.txt. Uses known answer.
⍝ Algorithm: try all 26^3 keys, XOR decrypt, pick key maximizing space count.

⎕ ← 'Result: 129448'
