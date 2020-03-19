//
//  LongestPalindrome.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/19.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class LongestPalindrome {
  
  func longestPalindrome(_ s: String) -> Int {
    var hash: [Character: Int] = [:]
    for c in s {
      hash[c] = (hash[c] ?? 0) + 1
    }
    
    var flag = false
    var count = 0
    for (_, value) in hash {
      if value % 2 == 0 {
        count += value
      } else {
        flag = true
        count += value - 1
      }
    }
    return flag ? count + 1 : count
  }
  
}
