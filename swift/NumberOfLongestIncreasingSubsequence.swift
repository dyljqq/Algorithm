//
//  NumberOfLongestIncreasingSubsequence.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/2.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class NumberOfLongestIncreasingSubsequence {
  
  func findNumberOfLIS(_ nums: [Int]) -> Int {
    var dp: [Int] = Array(repeating: 0, count: nums.count + 1)
    var cnt: [Int] = Array(repeating: 0, count: nums.count + 1)
    
    var maxLength = 0
    for i in 0..<nums.count {
      dp[i] = 1
      cnt[i] = 1
      for j in stride(from: i - 1, to: -1, by: -1) {
        if nums[i] > nums[j] {
          if dp[i] < dp[j] + 1 {
            dp[i] = dp[j] + 1
            cnt[i] = cnt[j]
          } else if dp[i] == dp[j] + 1 {
            cnt[i] += cnt[j]
          }
        }
      }
      maxLength = max(dp[i], maxLength)
    }
    
    return dp.enumerated().reduce(0) { $0 + ($1.element == maxLength ? cnt[$1.offset] : 0) }
  }
  
  func test() {
    print(findNumberOfLIS([10,9,1,4,5,6,2,3,4]))
    print(findNumberOfLIS([1,3,5,4,7]))
    print(findNumberOfLIS([2,2,2,2,2]))
    print(findNumberOfLIS([1,1,1,2,2,2,3,3,3]))
  }
  
}
