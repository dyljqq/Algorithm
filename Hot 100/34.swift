//
//  34.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/27.
//

import Foundation

class Leetcode34 {
  
  func helper(_ nums: [Int], target: Int) -> Int {
    var p = 0, q = nums.count
    while p < q {
      let mid = (p + q) / 2
      if nums[mid] < target {
        p = mid + 1
      } else {
        q = mid
      }
    }
    return q
  }
  
  func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let start = helper(nums, target: target)
    if start == nums.count || nums[start] != target {
      return [-1, -1]
    }
    return [start, helper(nums, target: target + 1) - 1]
  }
  
}
