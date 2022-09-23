//
//  26.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/23.
//

import Foundation

class Leetcode26 {
  
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else {
      return nums.count
    }
    var p = 0, q = 1
    while q < nums.count {
      if nums[p] < nums[q] {
        nums.swapAt(p + 1, q)
        p = p + 1
      }
      q = q + 1
    }
    return p + 1
  }
  
  func test() {
    var nums = [1, 1, 2]
    print(removeDuplicates(&nums))
    nums = [0,0,1,1,1,2,2,3,3,4]
    print(removeDuplicates(&nums))
  }
  
}
