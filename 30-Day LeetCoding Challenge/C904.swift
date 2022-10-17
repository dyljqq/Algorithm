//
//  C904.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/17.
//

import Foundation

class LeetcodeC904 {
  
  func totalFruit(_ fruits: [Int]) -> Int {
    var left = 0, right = 0, res = 0, hash: [Int: Int] = [:]
    
    for fruit in fruits {
      hash[fruit, default: 0] += 1
      while hash.keys.count > 2 {
        let f = fruits[left]
        hash[f] = hash[f]! - 1
        if hash[f]! == 0 {
          hash[f] = nil
        }
        left = left + 1
      }
      res = max(res, right - left + 1)
      right = right + 1
    }
    return res
  }
  
  func test() {
    print(totalFruit([1,2,1]))
    print(totalFruit([0,1,2,2]))
    print(totalFruit([1,2,3,2,2]))
  }
}
