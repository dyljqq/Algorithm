//
//  1531.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/28.
//

import Foundation

class Solution1531 {
    
    func cal(_ x: Int) -> Int {
        if x >= 100 {
            return 4
        } else if x >= 10 {
            return 3
        } else if x >= 2 {
            return 2
        }
        return 1
    }
    
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        let INF = 1000 * 1000
        var dp = Array(repeating: Array(repeating: INF, count: k + 1), count: s.count + 1)
        
        dp[0][0] = 0
        let arr = Array(s)
        for i in 1...s.count {
            for j in 0...min(i, k) {
                if j >= 1 {
                    dp[i][j] = min(dp[i - 1][j - 1], dp[i][j])
                }
                
                var x = 0, y = 0
                for l in stride(from: i, to: 0, by: -1) {
                    if arr[i - 1] == arr[l - 1] {
                        x += 1
                    } else {
                        y += 1
                    }
                    
                    if j >= y {
                        dp[i][j] = min(dp[i][j], dp[l - 1][j - y] + cal(x))
                    }
                }
            }
        }
        return dp[s.count][k]
    }
    
    func test() {
//        print(getLengthOfOptimalCompression("aaabcccd", 2))
//        print(getLengthOfOptimalCompression("aabbaa", 2))
//        print(getLengthOfOptimalCompression("aaaaaaaaaaa", 0))
        print(getLengthOfOptimalCompression("a", 1))
    }
}
