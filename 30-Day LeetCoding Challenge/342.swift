//
//  342.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/22.
//

import Foundation

class Leetcode342 {
  
  func isPowerOfFour(_ n: Int) -> Bool {
    var num = n
    while num != 0 && num % 4 == 0 {
      num /= 4
    }
    return num == 1
  }
  
}
