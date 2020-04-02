//
//  LongestContinuousIncreasingSubsequence.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/2.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LongestContinuousIncreasingSubsequence {
  
  func findLengthOfLCIS(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
      return 0
    }
    var maxLength = 0
    var count = 1
    for i in 1..<nums.count {
      if nums[i] > nums[i - 1] {
        count += 1
      } else {
        maxLength = max(maxLength, count)
        count = 1
      }
    }
    return max(maxLength, count)
  }
  
}
