//
//  CountingBits.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/7/21.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class CountingBits {
  
  func countBits(_ num: Int) -> [Int] {
    var arr = Array<Int>(repeating: 0, count: num + 1)
    for i in 1..<(num + 1) {
      arr[i] = arr[i & (i - 1)] + 1
    }
    return arr
  }
  
  func test() {
    let _ = countBits(9)
  }
  
}
