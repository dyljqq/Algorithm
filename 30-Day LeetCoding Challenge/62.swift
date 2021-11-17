//
//  62.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/17.
//

import Foundation

/// https://leetcode.com/problems/unique-paths/
class Leetcode62 {
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        dp[0][0] = 1
        for i in 0..<n {
            for j in 0..<m {
                if i > 0 && j > 0 {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                } else if i > 0 {
                    dp[i][j] = dp[i - 1][j]
                } else if j > 0 {
                    dp[i][j] = dp[i][j - 1]
                }
            }
        }
        return dp[n - 1][m - 1]
    }
    
    func test() {
        print(uniquePaths(2, 3))
        print(uniquePaths(3, 7))
        print(uniquePaths(3, 3))
    }
    
}
