//
//  BuyAndSellStock.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/2/25.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

// 最大子数组问题
class BuyAndSellStock {
  func maxProfit(_ prices: [Int]) -> Int {
    if prices.isEmpty {
      return 0
    }
    var curPrice = 0
    var finalPrice = 0
    for i in 1..<prices.count {
      let diff = prices[i] - prices[i - 1]
      curPrice = max(0, curPrice + diff)
      finalPrice = max(finalPrice, curPrice)
    }
    return finalPrice
  }
  
  static func test() {
    var arr = [7,1,5,3,6,4]
    print(BuyAndSellStock().maxProfit(arr))
    
    arr = [7,6,4,3,1]
    print(BuyAndSellStock().maxProfit(arr))
    
    arr = []
    print(BuyAndSellStock().maxProfit(arr))
  }
}
