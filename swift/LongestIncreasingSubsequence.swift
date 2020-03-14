//
//  LongestIncreasingSubsequence.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/14.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LongestIncreasingSubsequence {
  
  func binarySearch(_ val: Int, _ nums: [Int]) -> Int {
    var low = 0
    var high = nums.count
    while low < high {
      let mid = (low + high) / 2
      if nums[mid] < val {
        low = mid + 1
      } else {
        high = mid
      }
    }
    return low
  }
  
  func lengthOfLIS(_ nums: [Int]) -> Int {
    var res = 0
    var temp: [Int] = []
    
    for num in nums {
      let t = binarySearch(num, temp)
      if t == temp.count {
        temp.append(num)
      } else {
        temp[t] = num
      }
      if t == res {
        res += 1
      }
    }
    
    return res
  }
  
  func test() {
    print(lengthOfLIS([10,9,2,5,3,7,101,18]))
  }
  
}
