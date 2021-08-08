import Cocoa

func stoneGame(_ piles: [Int]) -> Bool {
    guard piles.count <= 1 else {
        return true
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: piles.count), count: piles.count)
    for (index, p) in piles.enumerated() {
        dp[index][index] = p
    }
    
    for l in 2..<piles.count {
        for i in 0..<piles.count {
            let j = i + l - 1
            dp[i][j] = max(piles[i] - dp[i + 1][j], piles[j] - dp[i][j - 1])
        }
    }
    
    return dp[0][piles.count - 1] > 0
}
