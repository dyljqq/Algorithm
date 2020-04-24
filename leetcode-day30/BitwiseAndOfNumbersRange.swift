//
//  BitwiseAndOfNumbersRange.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/24.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class BitwiseAndOfNumbersRange {
  
  func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
    var d = Int.max
    while (m & d) != (n & d) {
      d <<= 1
    }
    return m & d
  }
  
  func test() {
    print(rangeBitwiseAnd(5, 7))
    print(rangeBitwiseAnd(1, 1))
    print(rangeBitwiseAnd(2, 3))
    print(rangeBitwiseAnd(11, 14))
  }
  
}
