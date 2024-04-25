//
//  2370.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/25.
//

import Foundation

class Solution2370 {
    func longestIdealString(_ s: String, _ k: Int) -> Int {
        var dp = Array(repeating: 0, count: 26)
        let s = Array(s), a = Int("a".unicodeScalars.first!.value)
        for ch in s {
            let idx = Int(ch.unicodeScalars.first!.value) - a
            let left = max(idx - k, 0)
            let right = min(idx + k, 25)
            var cur = 0
            for j in left...right {
                cur = max(dp[j] + 1, cur)
            }
            dp[idx] = cur
        }
        return dp.max()!
    }
    
    func test() {
        print(longestIdealString("acfgbd", 2))
        print(longestIdealString("abcd", 3))
        print(longestIdealString("eduktdb", 15))
        print(longestIdealString("lkpkxcigcs", 6))
    }
}
