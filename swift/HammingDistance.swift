//
//  HammingDistance.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/29.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class HammingDistance {
  
  func hammingDistance(_ x: Int, _ y: Int) -> Int {
    var z = x ^ y
    var count = 0
    while(z != 0) {
      count += 1
      z = z & (z - 1)
    }
    return count
  }
  
  func test() {
    print(hammingDistance(1, 4))
  }
  
}
