//
//  62.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/30.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class Interview62 {
  
//  func lastRemaining(_ n: Int, _ m: Int) -> Int {
//    var arr = Array(0..<n)
//
//    var sum = 0
//    let m = m - 1
//    while arr.count > 1 {
//      let l = arr.count
//      sum += m
//      sum = sum >= l ? (sum % l) : sum
//      arr.remove(at: sum)
//    }
//    return arr[0]
//  }
  
  func lastRemaining(_ n: Int, _ m: Int) -> Int {
//    var ans = 0
//    for i in 2...n {
//      ans = (m + ans) % i
//    }
//    return ans
    return (2...n).reduce(0) { (m + $0) % $1 }
  }
  
  func test() {
    
    print(lastRemaining(5, 3))
    print(lastRemaining(10, 17))
    
  }
  
}
