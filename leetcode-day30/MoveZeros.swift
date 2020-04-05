//
//  MoveZeros.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/4.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MoveZeros {
  
  func moveZeroes(_ nums: inout [Int]) {
    var slow = 0
    for i in 0..<nums.count {
      if nums[slow] == 0 {
        if nums[i] != 0 {
          let temp = nums[i]
          nums[i] = nums[slow]
          nums[slow] = temp
          slow += 1
        }
      } else {
        slow += 1
      }
    }
  }
  
  func test() {
    var nums = [0,1,3,0,12]
    moveZeroes(&nums)
  }
  
}
