import UIKit

/**
 这题的思路用动态规划来做：
 
 假设我们知道面值为1...i之间的硬币的最小兑换硬币数为dp[i]
 
 那么dp[i]的值其实就是各个dp[i - coin]的最小值
 */

class CoinChange {
    
    // https://leetcode-cn.com/problems/coin-change/
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for i in stride(from: 1, to: amount + 1, by: 1) {
            for coin in coins {
                if i >= coin {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount] <= amount ? dp[amount] : -1
    }
    
}

let coin = CoinChange()
print(coin.coinChange([1, 2, 5], 11))
print(coin.coinChange([2], 3))
