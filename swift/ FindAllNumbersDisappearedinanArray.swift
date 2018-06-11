//
//   FindAllNumbersDisappearedinanArray.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/10.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class FindAllNumbers {
  
  func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var nums = nums
    (0..<nums.count).forEach {
      let index = abs(nums[$0]) - 1
      nums[index] = -abs(nums[index])
    }
    return (0..<nums.count).filter { nums[$0] > 0 }.map { $0 + 1 }
  }
  
  func test() {
    let arr = [4, 3, 2, 7, 8, 2, 3, 1]
    print(findDisappearedNumbers(arr))
  }
  
}
