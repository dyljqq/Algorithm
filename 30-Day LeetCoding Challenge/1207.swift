//
//  1207.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/30.
//

import Foundation

class Leetcode1207 {
  
  func uniqueOccurrences(_ arr: [Int]) -> Bool {
    var hash: [Int: Int] = [:]
    arr.forEach { hash[$0, default: 0] += 1 }
    var set = Set<Int>()
    for value in hash.values {
      if set.contains(value) {
        return false
      }
      set.insert(value)
    }
    return true
  }
  
  func test() {
    print(uniqueOccurrences([1,2,2,1,1,3]))
    print(uniqueOccurrences([1,2]))
    print(uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0]))
  }
  
}
