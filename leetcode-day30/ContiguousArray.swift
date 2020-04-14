//
//  ContiguousArray.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/14.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class ContiguousArray {
  
  func findMaxLength(_ nums: [Int]) -> Int {
    var hash: [Int: Int] = [:]
    var sum = 0
    var mx = 0
    hash[0] = 0
    for (index, num) in nums.enumerated() {
      sum += num == 1 ? 1 : -1
      if hash[sum] != nil {
        mx = max(mx, index - hash[sum]! + 1)
      } else {
        hash[sum] = index + 1
      }
    }
    return mx
  }
  
}
