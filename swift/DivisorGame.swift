//
//  DivisorGame.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/24.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class DivisorGame {
//  func helper(_ num: Int, _ dp: [Bool]) -> Bool {
//    for i in 1...(num / 2) {
//      if num % i == 0 && !dp[num - i] {
//        return true
//      }
//    }
//    return false
//  }
//
//  func divisorGame(_ N: Int) -> Bool {
//    var dp = Array(repeating: true, count: 1001)
//    if N < 3 {
//      return false
//    }
//    for i in 3...N {
//      dp[i] = helper(i, dp)
//    }
//    return dp[N]
//  }
  /**
   如果一个数是偶数m，那么找到一个能被自己整除的因子，做差得到的值，必定是个偶数
   如果是奇数，则恰恰相反
   */
  func divisorGame(_ N: Int) -> Bool {
    return N % 2 == 0
  }
  
  func test() {
    print(divisorGame(8))
    print(divisorGame(9))
//    for i in 3...10 {
//      print(divisorGame(i))
//    }
  }
}
