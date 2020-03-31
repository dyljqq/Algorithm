//
//  SortAnArray.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/31.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class SortAnArray {
  
  func swap(_ i: Int, _ j: Int, _ nums: inout [Int]) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
  }
  
  func partition(_ p: Int, _ q: Int, _ nums: inout [Int]) -> Int {
    guard !nums.isEmpty && p < q else { return p }
    let pivot = nums[q]
    var slow = p
    var fast = p
    while fast < q {
      if nums[fast] <= pivot {
        swap(slow, fast, &nums)
        slow += 1
      }
      fast += 1
    }
    swap(slow, q, &nums)
    return slow
  }
  
  func quickSort(_ p: Int, _ q: Int, _ nums: inout [Int]) {
    guard p < q else {
      return
    }
    let l = partition(p, q, &nums)
    quickSort(p, l - 1, &nums)
    quickSort(l + 1, q, &nums)
  }
  
  func sortArray(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else {
      return []
    }
    var nums = nums
    quickSort(0, nums.count - 1, &nums)
    return nums
  }
  
  func test() {
    print(sortArray([5,2,3,1]))
    print(sortArray([5,1,1,2,0,0]))
  }
  
}
