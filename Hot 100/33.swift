//
//  33.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/26.
//

import Foundation

class Leetcode33 {
  
  func search(_ nums: [Int], _ target: Int) -> Int {
    var p = 0, q = nums.count - 1
    while p <= q {
      let mid = (p + q) / 2
      if nums[mid] == target {
        return mid
      }
      
      if nums[mid] >= nums[p] {
        if nums[p] <= target && nums[mid] > target {
          q = mid - 1
        } else {
          p = mid + 1
        }
      } else {
        if nums[q] >= target && nums[mid] < target {
          p = mid + 1
        } else {
          q = mid - 1
        }
      }
    }
    return -1
  }
  
  func test() {
    print(search([4,5,6,7,0,1,2], 0))
    print(search([4,5,6,7,0,1,2], 3))
    print(search([1], 0))
  }
  
}
