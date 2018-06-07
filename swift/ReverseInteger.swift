//
//  ReverseInteger.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/7.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class ReverseInteger {
  func reverse(_ x: Int) -> Int {
    var result = 0
    var num = x
    while num != 0 {
      result = 10 * result + num % 10
      num = num / 10
    }
    return result > Int32.min && result < Int32.max ? result : 0
  }
  
  func test() {
    let tests = [123, -123, -100, -1029, -10, 1534236469]
    tests.forEach { print(reverse($0)) }
  }
}
