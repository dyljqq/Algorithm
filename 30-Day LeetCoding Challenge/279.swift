//
//  279.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/22.
//

import Foundation

// 279. Perfect Squares
// https://leetcode.com/problems/perfect-squares/
class Leetcode279 {
  func numSquares(_ n: Int) -> Int {
    var n = n
    while n % 4 == 0 {
      n = n / 4
    }
    
    var dp = Array(repeating: n + 1, count: n + 2)
    dp[0] = 0
    dp[1] = 1
    guard n >= 2 else { return dp[n] }
    for i in 2...n {
      var j = 1
      while j * j <= i {
        dp[i] = min(dp[i], dp[i - j * j] + 1)
        j = j + 1
      }
    }
    return dp[n]
  }
  
  func test() {
    print(numSquares(12))
    print(numSquares(13))
  }
}
