//
//  1.TwoSum.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/7.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class TwoSum {
  
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for (index, num) in nums.enumerated() {
      if let search = map[target - num] {
        return [search, index]
      }
      map[num] = index
    }
    return [Int]()
  }
  
  func test() {
    let results = twoSum([3, 3], 6)
    print("two sum:")
    results.forEach { print("\($0)") }
  }
  
}
