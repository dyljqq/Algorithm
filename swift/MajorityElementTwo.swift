//
//  MajorityElementTwo.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/13.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MajorityElementTwo {
  
  func majorityElement(_ nums: [Int]) -> [Int] {
    var arr: [Int] = []
    var d: [Int: Int] = [:]
    for num in nums {
      d[num] = (d[num] ?? 0) + 1
      if d[num]! > (nums.count / 3) && !arr.contains(num) {
        arr.append(num)
      }
    }
    return arr
  }
  
  func test() {
    print(majorityElement([3, 2]))
    print(majorityElement([3,2,3]))
    print(majorityElement([1,1,1,3,3,2,2,2]))
  }
  
}
