//
//  PerfectSquar.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/26.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class PerfectSquare {
  
//  func numSquares(_ n: Int) -> Int {
//    var dp: [Int] = Array(repeating: 0, count: n + 1)
//    dp[1] = 1
//    guard n > 1 else { return dp[n] }
//    for i in 2...n {
//      for j in 1...Int(sqrt(Double(i))) {
//        let val = dp[i - j * j] + 1
//        dp[i] = dp[i] > 0 ? min(dp[i], val) : val
//      }
//    }
//    return dp[n]
//  }
  
//  func numSquares(_ n: Int) -> Int {
//    var stack: [Int] = [0]
//    var n = n
//    while n % 4 == 0 {
//      n = n / 4
//    }
//    while stack.count <= n {
//      var val = Int.max
//      var i = 1
//      let m = stack.count
//      while (i * i) <= m {
//        val = min(val, stack[m - i * i] + 1)
//        i += 1
//      }
//      stack.append(val)
//    }
//    return stack[n]
//  }
  
  // 四平方定理
  func numSquares(_ n: Int) -> Int {
    var n = n
    while n % 4 == 0 {
      n = n / 4
    }
    if n % 8 == 7 { return 4 }
    var m = 0
    while m * m <= n {
      let l = Int(sqrt(Double(n - m * m)))
      if (l * l  + m * m) == n {
        return (l > 0 && m > 0) ? 2 : 1
      }
      m = m + 1
    }
    return 3
  }
  
  func test() {
    print(numSquares(1))
    print(numSquares(12))
    print(numSquares(13))
  }
  
}
