//
//  ShortestUnSortedContinuousSubarray.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/2.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class ShortestUnSortedContinuousSubarray {
  func findUnsortedSubarray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    let n = nums.count
    var mn = nums[n - 1]
    var mx = nums[0]
    var start = -1
    var end = -2
    for i in 1..<n {
      mx = max(mx, nums[i])
      mn = min(mn, nums[n - i - 1])
      if mx > nums[i] {
        end = i
      }
      if mn < nums[n - i - 1] {
        start = n - i - 1
      }
    }
    
    return end - start + 1
  }
  
  func test() {
    var arr = [2, 6, 4, 8, 10, 9, 9, 10, 11, 8, 15]
    print(findUnsortedSubarray(arr))
    
    arr = [6, 1, 2, 3, 4]
    print(findUnsortedSubarray(arr))

    arr = [4, 3, 2, 1]
    print(findUnsortedSubarray(arr))
    
    arr = [2, 3, 3, 2, 4]
    print(findUnsortedSubarray(arr))
    
    arr = [1, 2, 3, 4]
    print(findUnsortedSubarray(arr))
  }
  
}
