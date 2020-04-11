//
//  LongestPalidromicSubString.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/11.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LongestPalidromicSubString {
  
  func longestPalindrome(_ s: String) -> String {
    guard s.count > 1 else {
      return s
    }
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count + 1), count: s.count + 1)
    let arr = Array(s)
    
    var left = 0
    var maxLen = 1
    for i in 0..<arr.count {
      dp[i][i] = true
      for j in 0..<i {
        dp[i][j] = arr[i] == arr[j] && ((i - j) < 2 || dp[i - 1][j + 1])
        if dp[i][j] && maxLen < (i - j + 1) {
          maxLen = i - j + 1
          left = j
        }
      }
    }
    return String(arr[left..<(left + maxLen)])
  }
  
  func test() {
//    print(longestPalindrome("babad"))
//    print(longestPalindrome("cbbd"))
    print(longestPalindrome("a"))
  }
  
}
