//
//  46.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/8.
//

import Foundation

class Leetcode46 {
  
  var results = Set<[Int]>()

  func helper(_ nums: inout [Int], _ n: Int, _ i: Int) {
    if (i >= n) {
      results.insert(nums)
    } else {
      for j in i..<n {
        nums.swapAt(i, j)
        helper(&nums, n, i + 1)
        nums.swapAt(i, j)
      }
    }
  }
  
  func permute(_ nums: [Int]) -> [[Int]] {
    results = []
    var nums = nums
    helper(&nums, nums.count, 0)
    return Array(results)
  }
  
  func test() {
    print(permute([1,2,3]))
    print(permute([1, 0]))
    print(permute([1]))
  }
}
