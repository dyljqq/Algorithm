//
//  15.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/15.
//

import Foundation

class Leetcode15 {
  
  // nums = [-1,0,1,2,-1,-4]
  func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else {
      return []
    }
    let nums = nums.sorted()
    var left = 0, right = nums.count - 1
    var rs: [[Int]] = []
    for i in 0..<nums.count {
      if nums[i] > 0 {
        return rs
      }
      if i > 0 && nums[i] == nums[i - 1] {
        continue
      }
      
      left = i + 1
      right = nums.count - 1
      while left < right {
        let v = nums[left] + nums[right] + nums[i]
        if v == 0 {
          rs.append([nums[i], nums[left], nums[right]])
          while left < right && nums[left] == nums[left + 1] {
            left += 1
          }
          while left < right && nums[right] == nums[right - 1] {
            right -= 1
          }
          left = left + 1
          right = right - 1
        } else if v > 0 {
          right = right - 1
        } else {
          left = left + 1
        }
      }
    }
    return rs
  }
  
  func test() {
    print(threeSum([-1,0,1,2,-1,-4]))
    print(threeSum([0,1,1]))
    print(threeSum([0, 0, 0]))
  }
  
}
