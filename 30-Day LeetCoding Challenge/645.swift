//
//  645.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/23.
//

import Foundation

class Leetcode645 {
  
  func findErrorNums(_ nums: [Int]) -> [Int] {
    var hash: [Int: Int] = [:]
    for num in nums {
      hash[num, default: 0] += 1
    }
    
    var rs: [Int] = Array(repeating: 0, count: 2)
    for i in 1...nums.count {
      if let v = hash[i], v == 2 {
        rs[0] = i
      } else if hash[i] == nil {
        rs[1] = i
      }
    }
    return rs
  }
  
}
