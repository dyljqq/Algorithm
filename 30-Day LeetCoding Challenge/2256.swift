//
//  2256.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/4.
//

import Foundation

class Leetcode2256 {
  func minimumAverageDifference(_ nums: [Int]) -> Int {
    var dp: [Int] = Array(repeating: 0, count: nums.count)
    var sum = 0
    for (index, num) in nums.enumerated() {
      sum += num
      dp[index] = index >= 1 ? (dp[index - 1] + num) : num
    }
    
    let n = nums.count
    var mn: Int = Int.max, r = 0
    for index in 0..<n {
      let value = abs(dp[index] / (index + 1) - (sum - dp[index]) / ((n - index - 1) > 0 ? (n - index - 1) : 1))
      if value < mn {
        mn = value
        r = index
      }
    }
    return r
  }
  
  func test() {
    print(minimumAverageDifference([2,5,3,9,5,3]))
    print(minimumAverageDifference([0]))
  }
}
