//
//  ProductOfArrayExceptSelf.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/15.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class ProductOfArrayExceptSelf {
  
  func productExceptSelf(_ nums: [Int]) -> [Int] {
    var res = Array(repeating: 1, count: nums.count)
    for i in 1..<nums.count {
      res[i] = res[i - 1] * nums[i - 1]
    }
    
    var right = 1
    for i in stride(from: nums.count - 1, to: -1, by: -1) {
      res[i] *= right
      right *= nums[i]
    }
    return res
  }
  
}
