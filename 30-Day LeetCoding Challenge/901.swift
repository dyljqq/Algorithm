//
//  901.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/9.
//

import Foundation

// 901. Online Stock Span
class StockSpanner {

  var prices: [Int] = []
  var stocks: [Int] = []
  
  init() {
      
  }
  
  func next(_ price: Int) -> Int {
    var total = 1
    var index = prices.count - 1
    while index >= 0 {
      let p = prices[index]
      guard p <= price else { break }
      total += stocks[index]
      index = index - stocks[index]
    }
    prices.append(price)
    stocks.append(total)
    return total
  }
}
