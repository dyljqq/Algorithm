//
//  TheMasseuseLcci.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/24.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class TheMasseuseLcci {
  
  func massage(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
      return 0
    }
    var slow = 0
    var fast = nums[0]
    for num in nums[1..<nums.count] {
      let temp = max(slow + num, fast)
      slow = fast
      fast = temp
    }
    return fast
  }
  
  func test() {
    print(massage([1, 1]))
    print(massage([1,2,3,1]))
    print(massage([2,7,9,3,1]))
    print(massage([2,1,4,5,3,1,1,3]))
  }
  
}
