//
//  HappyNumber.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/2.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class HappyNumber {
  
  func helper(_ n: Int) -> Int {
    var n = n
    var cnt = 0
    while n > 0 {
      let a = n % 10
      cnt += a * a
      n /= 10
    }
    return cnt
  }
  
  func isHappy(_ n: Int) -> Bool {
    if n == 0 {
      return false
    } else if n == 1 {
      return true
    }
    
    var arr: [Int] = []
    var n = n
    while !arr.contains(n) {
      if n == 1 {
        return true
      }
      arr.append(n)
      n = helper(n)
    }
    return false
  }
  
  func test() {
    print(isHappy(3))
    print(isHappy(37))
    print(isHappy(19))
  }
  
}
