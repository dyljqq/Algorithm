
//
//  PalindromeNumber.swift
//  LeetCode
//
//  Created by 季勤强 on 2018/6/8.
//  Copyright © 2018年 dyljqq. All rights reserved.
//

import Foundation

class PalindromeNumber {
  
  func isPalindrome(_ x: Int) -> Bool {
    guard x >= 0 else { return false }
    var num = x
    var result = 0
    while num != 0 {
      result = result * 10 + num % 10
      num = num / 10
    }
    return result == x
  }
  
  func test() {
    let arr = [121, -121, 10]
    arr.forEach { print(isPalindrome($0)) }
  }
  
}
