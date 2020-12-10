//
//  longestCommonSubsequence.swift
//  Leetcode
//
//  Created by 季勤强 on 2020/12/8.
//

import Foundation

class LongestCommonSubsequence {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard text1.count > 0 && text2.count > 0 else {
            return 0
        }
        let arr1 = Array(text1)
        let arr2 = Array(text2)
        var dp = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        for i in 1..<dp.count {
            for j in 1..<dp[0].count {
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
        print(longestCommonSubsequence("bl", "yby"))
    }
}
