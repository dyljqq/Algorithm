//
//  1143.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/25.
//

import Foundation

class Solution1143 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let arr1 = Array(text1), arr2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: arr2.count + 1), count: arr1.count + 1)
        for i in 1...arr1.count {
            for j in 1...arr2.count {
                if arr1[i - 1] == arr2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[arr1.count][arr2.count]
    }
    
    func test() {
        print(longestCommonSubsequence("abcde", "ace"))
        print(longestCommonSubsequence("abc", "abc"))
        print(longestCommonSubsequence("abc", "def"))
    }
}
