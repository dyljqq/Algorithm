//
//  1073.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/29.
//

import Foundation

class Leetcode1073 {
  
  func addNegabinary(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var rs: [Int] = []
    var carry = 0, n = arr1.count - 1, m = arr2.count - 1
    while n >= 0 || m >= 0 || carry != 0 {
      if n >= 0 {
        carry = carry + arr1[n]
      }
      if m >= 0 {
        carry = carry + arr2[m]
      }
      n = n - 1
      m = m - 1
      rs.append(carry & 1)
      carry = -(carry >> 1)
    }
    
    while rs.count > 1 && rs.last! == 0 {
      rs.removeLast()
    }
    
    return rs.reversed()
  }
  
  func test() {
    print(addNegabinary([1,1,1,1,1], [1,0,1]))
    print(addNegabinary([1], [1, 1, 0, 1]))
  }
  
}
