//
//  BurstBalloons.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/20.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class BurstBalloons {
  
  func maxCoins(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
      return 0
    }
    let n = nums.count
    var nums = nums
    nums.insert(1, at: 0)
    nums.append(1)
    var dp = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 2)
    for i in 1...n {
      for left in 1...(n - i + 1) {
        let right = i + left - 1
        for k in left...right {
          dp[left][right] = max(dp[left][right], dp[left][k - 1] + dp[k + 1][right] + nums[left - 1] * nums[k] * nums[right + 1])
        }
      }
    }
    return dp[1][n]
  }
  
  func test() {
    print(maxCoins([3,1,5,8]))
  }
  
}
