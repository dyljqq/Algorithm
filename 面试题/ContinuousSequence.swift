//
//  ContinueArray.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/6.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

/**
 面试题57 - II. 和为s的连续正数序列
 */

class ContinuousSequence {
  func findContinuousSequence(_ target: Int) -> [[Int]] {
    return (1..<Int(target / 2 + 1)).reduce([[Int]]()) { result, n in
      var result = result
      let v = (sqrt(Double(4 * n * n - 4 * n + 8 * target + 1)) - 1) / 2
      if v == floor(v) {
        result.append(Array(n...Int(v)))
      }
      return result
    }
  }
  
  func test() {
    print(findContinuousSequence(1))
    print(findContinuousSequence(2))
    print(findContinuousSequence(3))
    print(findContinuousSequence(4))
    print(findContinuousSequence(5))
    print(findContinuousSequence(9))
    print(findContinuousSequence(15))
  }
}
