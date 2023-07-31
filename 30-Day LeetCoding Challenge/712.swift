//
//  712.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/31.
//

import Foundation

class Solution712 {
    
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: s2.count + 1), count: s1.count + 1)
        let s1 = s1.compactMap { Int($0.asciiValue!) }
        let s2 = s2.compactMap { Int($0.asciiValue!) }
        for i in 1...s1.count {
            dp[i][0] = dp[i - 1][0] + s1[i - 1]
        }
        for i in 1...s2.count {
            dp[0][i] = dp[0][i - 1] + s2[i - 1]
        }
        
        for i in 1...s1.count {
            for j in 1...s2.count {
                if s1[i - 1] == s2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j] + s1[i - 1], dp[i][j - 1] + s2[j - 1])
                }
            }
        }
        
        return dp[s1.count][s2.count]
    }
    
    func test() {
        print(minimumDeleteSum("sea", "eat"))
        print(minimumDeleteSum("delete", "leet"))
    }
    
}
