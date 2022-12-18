//
//  739.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/18.
//

import Foundation

class Leetcode739 {
  
  struct Temp {
    let index: Int
    let val: Int
  }
  
  func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    var rs = Array(repeating: 0, count: temperatures.count)
    var stack: [Temp] = []
    
    for (index, temperature) in temperatures.enumerated() {
      while let top = stack.last, top.val < temperature {
        rs[top.index] = index - top.index
        stack.popLast()
      }
      stack.append(Temp(index: index, val: temperature))
    }
    return rs
  }
}
