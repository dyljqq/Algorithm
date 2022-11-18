//
//  263.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/18.
//

import Foundation

// 263. Ugly Number
// https://leetcode.com/problems/ugly-number/
class Leetcode263 {
  func isUgly(_ n: Int) -> Bool {
    guard n > 1 else { return n == 1 }
    if n % 2 == 0 {
      return isUgly(n / 2)
    } else if n % 3 == 0 {
      return isUgly(n / 3)
    } else if n % 5 == 0 {
      return isUgly(n / 5)
    }
    return false
  }
}
