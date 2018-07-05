//
//  HouseRobber.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/5.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class HourseRobber {
  
  func rob(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var nums = nums
    for i in 0..<nums.count {
      if i == 2 {
        nums[i] += nums[0]
      } else if i > 2 {
        nums[i] += max(nums[i - 2], nums[i - 3])
      }
    }
    let end = nums.count - 1
    return end > 0 ? max(nums[end], nums[end - 1]) : nums[0]
  }
  
  func test() {
    var nums = [1, 2, 3, 1]
    print(rob(nums))
    
    nums = [7, 2, 3, 9, 1]
    print(rob(nums))
    
    nums = [9]
    print(rob(nums))
  }
  
}
