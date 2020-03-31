//
//  PartitialToKEqualSumSubsets.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/31.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class PartitialToKEqualSumSubsets {
  
  func helper(_ p: Int, _ k: Int, _ target: Int, _ sum: Int, _ nums: inout [Int], _ visited: inout [Bool]) -> Bool {
    if k == 1 {
      return true
    }
    if sum == target {
      return helper(0, k - 1, target, 0, &nums, &visited)
    }
    
    for i in p..<nums.count {
      if visited[i] {
        continue
      }
      if sum + nums[i] > target {
        break
      }
      visited[i] = true
      if helper(i + 1, k, target, sum + nums[i], &nums, &visited) {
        return true
      }
      visited[i] = false
    }
    return false
  }
  
  func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
    guard !nums.isEmpty && nums.count >= k else {
      return false
    }
    
    let sum = nums.reduce(0) { $0 + $1 }
    if sum % k > 0 { return false }
    let target = sum / k
    
    var nums = nums.sorted()
    var visited = Array(repeating: false, count: nums.count)
    return helper(0, k, target, 0, &nums, &visited)
  }
  
  func test() {
//    print(canPartitionKSubsets([4,3,2,3,5,2,1], 2))
    print(canPartitionKSubsets([10,10,10,7,7,7,7,7,7,6,6,6], 3))
  }
  
}
