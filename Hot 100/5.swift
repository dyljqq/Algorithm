//
//  5.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/12.
//

import Foundation

class Leetcode5 {
  
  func longestPalindrome(_ s: String) -> String {
    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    let arr = Array(s)
    var left = 0, maxLen = 1
    
    for i in 0..<arr.count {
      dp[i][i] = true
      for j in 0..<i {
        dp[j][i] = (arr[j] == arr[i] && ((i - j) < 2 || dp[j + 1][i - 1]))
        if dp[j][i] && maxLen < i - j + 1 {
          maxLen = max(i - j + 1, maxLen)
          left = j
        }
      }
    }
    return String(arr[left..<(left + maxLen)])
  }
  
  func test() {
//    print(longestPalindrome("babad"))
//    print(longestPalindrome("cbbd"))
//    print(longestPalindrome("a"))
    print(longestPalindrome("ccc"))
  }
  
}
