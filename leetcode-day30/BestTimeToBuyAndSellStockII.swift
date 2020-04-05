//
//  BestTimeToBuyAndSellStockII.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/5.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class BestTimeToBuyAndSellStockII {
  
  func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else { return 0 }
    var profit = 0
    for i in 1..<prices.count {
      let diff = prices[i] - prices[i - 1]
      if diff > 0 {
        profit += diff
      }
    }
    return profit
  }
  
  func test() {
    print(maxProfit([7,1,5,3,6,4]))
    print(maxProfit([1,2,3,4,5]))
    print(maxProfit([7,6,4,3,1]))
  }
  
}
