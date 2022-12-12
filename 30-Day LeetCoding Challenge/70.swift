//
//  70.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/12.
//

import Foundation

// 70. Climbing Stairs
// https://leetcode.com/problems/climbing-stairs/description/
class Leetcode70 {
  func climbStairs(_ n: Int) -> Int {
    let total = 46
    var dp = Array(repeating: 0, count: total)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
      dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
  }
}
