//
//  PerfectSquares.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/14.
//

import Foundation

class PerfectSquares {
    
    // 四平方定理
//    func numSquares(_ n: Int) -> Int {
//        var n = n
//        while n % 4 == 0 {
//            n = n / 4
//        }
//
//        let m = Int(sqrt(Double(n)))
//        if m * m == n {
//            return 1
//        }
//
//        if n % 8 == 7 {
//            return 4
//        }
//
//        for num in 1...m {
//            let a = Int(sqrt(Double(n - num * num)))
//            if (a * a + num * num) == n {
//                return 2
//            }
//        }
//        return 3
//    }
    
    // 动态规划
    func numSquares(_ n: Int) -> Int {
        var n = n
        // 预处理n
        while n % 4 == 0 {
            n = n / 4
        }
        
        var dp = Array(repeating: n + 1, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        if n < 2 {
            return dp[n]
        }
        for num in 2...n {
            var j = 0
            while j * j <= num {
                dp[num] = min(dp[num - j * j] + 1, dp[num])
                j += 1
            }
        }
        return dp[n]
    }
    
    func test() {
        print(numSquares(12))
        print(numSquares(13))
        print(numSquares(2))
    }
}
