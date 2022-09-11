//
//  3.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/11.
//

import Foundation

class Leetcode3 {
  
  func lengthOfLongestSubstring(_ s: String) -> Int {
    var hash: [String.Element: Int] = [:]
    var start = 0, ans = 0
    for (i, ch) in s.enumerated() {
      if let v = hash[ch] {
        start = max(start, v + 1)
      }
      ans = max(ans, i - start + 1)
      hash[ch, default: -1] = i
    }
    return ans
  }
  
}
