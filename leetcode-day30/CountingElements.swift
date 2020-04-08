//
//  CountingElements.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/8.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class CountingElements {
  
  func countElements(_ arr: [Int]) -> Int {
    guard !arr.isEmpty else { return 0 }
    var temps = Array(repeating: 0, count: 1002)
    for a in arr {
      temps[a] = temps[a] + 1
    }
    
    var cnt = 0
    for i in 0..<1001 {
      if temps[i] > 0 && temps[i + 1] > 0 {
        cnt += temps[i]
      }
    }
    return cnt
  }
  
  func test() {
    print(countElements([1,2,3]))
    print(countElements([1,1,3,3,5,5,7,7]))
    print(countElements([1,3,2,3,5,0]))
    print(countElements([1,1,2,2]))
    print(countElements([1,1,2]))
  }
  
}
