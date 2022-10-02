//
//  o03.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/2.
//

import Foundation

class LeetcodeO03 {
  
  func findRepeatNumber(_ nums: [Int]) -> Int {
    var hash: [Int: Int] = [:]
    for num in nums {
      hash[num, default: 0] += 1
      if let v = hash[num], v > 1 {
        return num
      }
    }
    return -1
  }
  
  func test() {
    print(findRepeatNumber([2, 3, 1, 0, 2, 5, 3]))
  }
  
}
