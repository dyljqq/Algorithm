//
//  121.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/10.
//

import Foundation

class Leetcode121 {
  
  func maxProfit(_ prices: [Int]) -> Int {
    var minVal = Int.max
    var maxPrice = Int.min
    
    for price in prices {
      minVal = min(price, minVal)
      maxPrice = max(price - minVal, maxPrice)
    }
    
    return maxPrice
  }
  
}
