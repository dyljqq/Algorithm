//
//  1752.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/27.
//

import Foundation

class Leetcode1752 {
  func check(_ nums: [Int]) -> Bool {
    guard !nums.isEmpty else { return false }
    var x = 0
    for i in 1..<nums.count {
      if nums[i - 1] > nums[i] {
        x = i
        break
      }
    }
    
    if x == 0 {
      return true
    }
    for i in (x + 1)..<nums.count {
      if nums[i] < nums[i - 1] {
        return false
      }
    }
    return nums[0] >= nums.last!
  }
  
  func test() {
    print(check([3,4,5,1,2]))
    print(check([2,1,3,4]))
    print(check([1,2,3]))
  }
}
