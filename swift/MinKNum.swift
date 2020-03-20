//
//  MinKNum.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/20.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MinKNum {
  
  func swap(_ p: Int, _ q: Int, _ nums: inout [Int]) {
    let temp = nums[p]
    nums[p] = nums[q]
    nums[q] = temp
  }
  
  func quickSort(_ start: Int, _ end: Int, _ k: Int, _ nums: inout [Int]) {
    if start >= end {
      return
    }
    var p = start
    var q = start
    let pivot = nums[end - 1]
    while p < (end - 1) {
      if nums[p] < pivot {
        swap(p, q, &nums)
        q = q + 1
      }
      p += 1
    }
    swap(q, end - 1, &nums)

    if q < k {
      quickSort(q + 1, end, k, &nums)
    } else if q > k {
      quickSort(start, q, k, &nums)
    }
  }
  
  func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
    var nums = arr
    quickSort(0, arr.count, k, &nums)
    return Array(nums[0..<k])
  }
  
  func test() {
    print(getLeastNumbers([4, 5, 1, 6, 2, 7, 3], 4))
    print(getLeastNumbers([3, 2, 1], 2))
    print(getLeastNumbers([0,1,2,1], 1))
  print(getLeastNumbers([0,1,1,1,4,5,3,7,7,8,10,2,7,8,0,5,2,16,12,1,19,15,5,18,2,2,22,15,8,22,17,6,22,6,22,26,32,8,10,11,2,26,9,12,9,7,28,33,20,7,2,17,44,3,52,27,2,23,19,56,56,58,36,31,1,19,19,6,65,49,27,63,29,1,69,47,56,61,40,43,10,71,60,66,42,44,10,12,83,69,73,2,65,93,92,47,35,39,13,75], 75))
  }
  
}
