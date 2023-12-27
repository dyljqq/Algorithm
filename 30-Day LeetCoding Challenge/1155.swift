//
//  1155.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/26.
//

import Foundation

class Solution1155 {
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: target + 1), count: n + 1)
        dp[0][0] = 1
        let mode = Int(pow(10, 9.0) + 7)
        for i in 1...n {
            for j in 1...target {
                for a in 1...min(j, k) {
                    dp[i][j] = (dp[i][j] + dp[i - 1][j - a]) % mode
                }
            }
        }
        return dp[n][target] % mode
    }
    
    func test() {
        print(numRollsToTarget(1, 6, 3))
        print(numRollsToTarget(2, 6, 7))
        print(numRollsToTarget(30, 30, 500))
    }
}
