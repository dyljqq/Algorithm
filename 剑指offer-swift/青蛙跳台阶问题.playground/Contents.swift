import Cocoa

class Solution {
    func numWays(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 2)
        dp[0] = 1
        dp[1] = 1
        for i in stride(from: 2, to: n + 1, by: 1) {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        
        return dp[n]
    }
}

let solution = Solution()
print(solution.numWays(2))
print(solution.numWays(7))
print(solution.numWays(0))
print(solution.numWays(1))
