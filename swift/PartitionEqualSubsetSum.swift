//
//  PartitionEqualSubsetSum.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/31.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class PartitionEqualSubsetSum {
  
  func canPartition(_ nums: [Int]) -> Bool {
    guard !nums.isEmpty else { return false }
    let sum = nums.reduce(0) { $0 + $1 }
    if sum % 2 == 1 {
      return false
    }
    
    let target = sum / 2
    var dp = Array(repeating: false, count: target + 1)
    dp[0] = true
    for num in nums {
      for i in stride(from: target, to: num - 1, by: -1) {
        dp[i] = dp[i] || dp[i - num]
      }
      if dp[target] {
        return true
      }
    }
    return dp[target]
  }

}
