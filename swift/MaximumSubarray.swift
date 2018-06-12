//
//  MaximumSubarray.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/12.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class MaximumSubarray {
  
  func maxSubArray(_ nums: [Int]) -> Int {
    var sum = 0
    var result = Int.min
    for num in nums {
      if sum < 0 { sum = 0 }
      sum += num
      result = max(result, sum)
    }
    return result
  }
  
  func test() {
    let arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    print(maxSubArray(arr))
  }
  
}
