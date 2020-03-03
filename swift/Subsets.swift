//
//  Subsets.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/3.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class SubSets {
  
//  func helper(_ num: Int, _ nums: [[Int]]) -> [[Int]] {
//    var results = [[Int]]()
//    for i in 0..<nums.count {
//      var arr = nums[i]
//      arr.append(num)
//      results.append(arr)
//    }
//    return nums + results
//  }
//
//  func subsets(_ nums: [Int]) -> [[Int]] {
//    var results: [[Int]] = [[]]
//    for num in nums {
//      results = helper(num, results)
//    }
//    return results
//  }
  
  /**
   swift 还是博大精深啊
   */
  func subsets(_ nums: [Int]) -> [[Int]] {
    return nums.reduce([[]]) { result, num in
      result + result.map { $0 + [num] }
    }
  }
  
  func test() {
    var arr = [1, 2, 3]
    print(subsets(arr))
  }
}
