//
//  1143.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/15.
//

import Foundation

class Leetcode1143 {
  func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    guard !text1.isEmpty && !text2.isEmpty else { return 0 }
    let textArr1 = Array(text1)
    let textArr2 = Array(text2)
    var dp = Array(repeating: Array(repeating: 0, count: textArr2.count + 1), count: textArr1.count + 1)
    
    for i in 1...textArr1.count {
      for j in 1...textArr2.count {
        if textArr1[i - 1] == textArr2[j - 1] {
          dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
          dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
      }
    }
    return dp[textArr1.count][textArr2.count]
  }
}
