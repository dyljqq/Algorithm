//
//  BestTimeToBuyAndSellStock.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/9.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class BestTimeToBuyAndSellStock {
  
  func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {
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
  
}
