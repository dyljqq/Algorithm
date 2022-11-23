//
//  1742.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/23.
//

import Foundation

class Leetcode1742 {
  func countBalls(_ lowLimit: Int, _ highLimit: Int) -> Int {
    var hash: [Int: Int] = [:]
    var mx = Int.min
    for var num in lowLimit...highLimit {
      var sum = 0
      while num > 0 {
        sum = sum + num % 10
        num = num / 10
      }
      hash[sum, default: 0] += 1
      mx = max(hash[sum, default: 0], mx)
    }
    return mx
  }
  
  func test() {
    print(countBalls(1, 10))
    print(countBalls(5, 15))
    print(countBalls(19, 28))
  }
}
