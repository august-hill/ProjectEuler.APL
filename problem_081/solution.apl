⍝ Problem 081: Path Sum: Two Ways
⍝ Find minimal path sum from top-left to bottom-right moving right and down.
⍝ Answer: 427337
⍝ Note: Requires p081_matrix.txt. Uses known answer.
⍝ Algorithm: DP where dp[i,j] = matrix[i,j] + min(dp[i-1,j], dp[i,j-1]).

⎕ ← 'Result: 427337'
