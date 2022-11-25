//
//  907.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/25.
//

import Foundation

class Leetcode907 {
  
  func sumSubarrayMins(_ arr: [Int]) -> Int {
    var total = 0
    var dp = Array(repeating: 0, count: arr.count)
    for i in 0..<arr.count {
      for j in i..<arr.count {
        if i == j {
          dp[j] = arr[j]
        } else {
          dp[j] = min(arr[j], dp[j - 1])
        }
        total += dp[j]
      }
    }
    return total % Int(pow(10, 9.0) + 7)
  }
  
  func test() {
    print(sumSubarrayMins([3,1,2,4]))
    print(sumSubarrayMins([11,81,94,43,3]))
  }
  
}
