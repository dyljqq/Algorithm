//
//  BestTimeToBuyAndSellStockWithCooldown.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/20.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class BestTimeToBuyAndSellStockWithCooldown {

  func maxProfit(_ prices: [Int]) -> Int {
    var sold = 0
    var rest = 0
    var hold = -1000000
    
    for price in prices {
      let preSold = sold
      sold = hold + price
      hold = max(hold, rest - price)
      rest = max(rest, preSold)
    }
    return max(rest, sold)
  }
  
  func test() {
    print(maxProfit([1,2,3,0,2]))
  }

}
