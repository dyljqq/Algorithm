//
//  LongestIncreasingSubSequenceII.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/2.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LongestIncreasingSubSequenceII {
  
  func helper(_ pivot: Int, _ nums: [Int]) -> Int {
    var p = 0
    var q = nums.count
    while p < q {
      let mid = (p + q) / 2
      if nums[mid] == pivot {
        return mid
      } else if nums[mid] < pivot {
        p = mid + 1
      } else {
        q = mid
      }
    }
    return p
  }
  
  func lengthOfLIS(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
      return 0
    }
    var arr: [Int] = []
    for num in nums {
      let pos = helper(num, arr)
      if pos >= arr.count {
        arr.append(num)
      } else {
        arr[pos] = num
      }
    }
    return arr.count
  }
  
  func test() {
    print(lengthOfLIS([10,9,2,5,3,7,101,18]))
    print(lengthOfLIS([10,9,1,4,5,2,3,4]))
  }
  
}
