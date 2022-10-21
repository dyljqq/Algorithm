//
//  C901.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/21.
//

import Foundation

class LeetcodeC901 {
  
  var prices: [Int] = []
  var dp: [Int] = []
  
  init() {

  }
  
  func next(_ price: Int) -> Int {
    var count = prices.count - 1, sum = 1
    while count >= 0 && price >= prices[count] {
      sum += dp[count]
      count = count - dp[count]
    }
    prices.append(price)
    dp.append(sum)
    return dp.last ?? 1
  }
  
  func test() {
    for price in [100, 80, 60, 70, 60, 75, 85] {
      print(next(price))
    }
    print("---------------")
  }
  
}
