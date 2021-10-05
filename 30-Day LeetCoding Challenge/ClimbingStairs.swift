//
//  ClimbingStairs.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/5.
//

import Foundation

class ClimbingStairs {
    
    func climbStairs(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: 46)
        dp[1] = 1
        dp[2] = 2
        if n < 3 {
            return dp[n]
        }
        for index in 3...n {
            dp[index] = dp[index - 1] + dp[index - 2]
        }
        return dp[n]
    }
    
}
