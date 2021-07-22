import Cocoa

class Solution {
    func cuttingRope(_ n: Int) -> Int {
        
        if n <= 1 {
            return 0
        } else if n == 2 {
            return 1
        } else if n == 3 {
            return 2
        }
        
        var dp = Array(repeating: 0, count: n + 10)
        dp[1] = 1
        dp[2] = 2
        dp[3] = 3
        dp[4] = 4
        
        for i in 4...n {
            var mx = Int.min
            for j in stride(from: 1, to: i / 2 + 1, by: 1) {
                dp[i] = dp[j] * dp[i - j]
                if dp[i] > mx {
                    mx = dp[i]
                }
            }
            dp[i] = mx
        }
        return dp[n]
    }
}

let solution = Solution()
print(solution.cuttingRope(2))
print(solution.cuttingRope(10))
print(solution.cuttingRope(4))
