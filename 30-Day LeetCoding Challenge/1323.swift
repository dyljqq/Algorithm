//
//  1323.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/7.
//

import Foundation

class Leetcode1323 {
  func maximum69Number (_ num: Int) -> Int {
    var rs: [Int] = []
    var num = num
    while num > 0 {
      rs.append(num % 10)
      num = num / 10
    }
    
    for i in stride(from: rs.count - 1, to: -1, by: -1) {
      if rs[i] == 6 {
        rs[i] = 9
        break
      }
    }
    
    var sum = 0
    for i in stride(from: rs.count - 1, to: -1, by: -1) {
      sum = 10 * sum + rs[i]
    }
    return sum
  }
  
  func test() {
    print(maximum69Number(9669))
    print(maximum69Number(9996))
    print(maximum69Number(9999))
  }
}
