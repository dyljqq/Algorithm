//
//  7.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/18.
//

import Foundation

class Leetcode7 {
  
  func reverse(_ x: Int) -> Int {
    let flag = x > 0
    var y = 0, x = abs(x)
    while x > 0 {
      let remain = x % 10
      y = y * 10 + remain
      x = x / 10
    }
    let r = flag ? y : -y
    return r >= Int(Int32.min) && r <= Int(Int32.max) ? r : 0
  }
  
  func test() {
    print(reverse(123))
    print(reverse(-123))
    print(reverse(120))
  }
  
}
