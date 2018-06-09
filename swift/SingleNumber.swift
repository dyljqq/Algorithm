//
//  SingleNumber.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/9.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class SingleNumber {
  
  func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
      result ^= num
    }
    return result
  }
  
  func test() {
    print(singleNumber([2, 2, 1]))
    print(singleNumber([4, 1, 2, 1, 2]))
  }
  
}
