//
//  55.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/26.
//

import Foundation

class Leetcode55 {
  func canJump(_ nums: [Int]) -> Bool {
    let n = nums.count
    var reach = 0
    for (index, num) in nums.enumerated() {
      guard index <= reach && reach < n else { break }
      reach = max(reach, num + index)
    }
    return reach >= (n - 1)
  }
  
  func test() {
    print(canJump([3,2,1,0,4]))
  }
}
