//
//  KthLargestElement.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/6.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class KthLargestElement{
  
  func swap(_ p: Int, _ q: Int, _ nums: inout [Int]) {
    let temp = nums[p]
    nums[p] = nums[q]
    nums[q] = temp
  }
  
  func partition(_ start: Int, _ end: Int, _ nums: inout [Int]) -> Int {
    if start >= end {
      return 0
    }
    var p = start
    var q = end - 2
    let pivot = nums[end - 1]
    while p <= q {
      if (nums[p] > pivot && nums[q] < pivot) {
        swap(p, q, &nums)
        p += 1
        q -= 1
      }
      if nums[p] <= pivot {
        p += 1
      }
      if nums[q] >= pivot {
        q -= 1
      }
    }
    swap(end - 1, p, &nums)
    return p
  }
  
  func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums
    var p = 0
    var q = nums.count
    while p < q {
      let pos = partition(p, q, &nums)
      if pos == (nums.count - k) {
        return nums[pos]
      } else if pos > (nums.count - k) {
        q = pos
      } else {
        p = pos + 1
      }
    }
    return 0
  }
  
  func test() {
    print(findKthLargest([3,2,1,5,6,4], 2))
    print(findKthLargest([3,2,3,1,2,4,5,5,6], 100))
    print(findKthLargest([3,2,3,1,2,4,5,5,6,7,7,8,2,3,1,1,1,10,11,5,6,2,4,7,8,5,6], 20))
  }
  
}
