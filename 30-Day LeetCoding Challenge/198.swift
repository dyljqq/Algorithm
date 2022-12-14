//
//  198.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/14.
//

import Foundation

class Leetcode198 {
  func rob(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums.isEmpty ? 0 : nums[0] }
    var dp = Array(repeating: 0, count: nums.count + 1)
    dp[1] = nums[0]
    for i in 2...nums.count {
      dp[i] = max(dp[i - 1], dp[i - 2] + nums[i - 1])
    }
    return dp[nums.count]
  }
  
  func test() {
    print(rob([1,2,3,1]))
    print(rob([2,7,9,3,1]))
  }
}
