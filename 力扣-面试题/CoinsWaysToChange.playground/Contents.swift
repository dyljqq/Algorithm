import UIKit

/**
 比较好的理解方式是，我刚开始只有一种硬币，那么面对所有的面值，我的兑换方法显然只有一种
 那么这个时候，我添加了一种新的硬币，那么在原有的基础上，那么这个面值的纸币的兑换方式，就变成了，我用了新面值的硬币，与我没用新面值的硬币的和，以此类推。。
 */

class CoinsWaysToChange {
    
    // https://leetcode-cn.com/problems/coin-lcci/
    func waysToChange(_ n: Int) -> Int {
        let coins = [1, 5, 10, 25]
        
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        for coin in coins {
            for i in stride(from: coin, to: n + 1, by: 1) {
                dp[i] = (dp[i] + dp[i - coin]) % 1000000007
            }
        }
        return dp[n]
    }
    
}

let coins = CoinsWaysToChange()
print(coins.waysToChange(5))
print(coins.waysToChange(10))
