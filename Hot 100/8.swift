//
//  8.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/19.
//

import Foundation

class Leetcode8 {
  
  func myAtoi(_ s: String) -> Int {
    guard !s.isEmpty else {
      return 0
    }
    var start = 0, arr = Array(s)
    while start < s.count && arr[start] == Character(" ") {
      start += 1
    }
    
    var isNegative = false, r = 0
    for i in start..<arr.count {
      let ch = arr[i]
      if start == i && [Character("-"), Character("+")].contains(ch) {
        isNegative = Character("-") == ch
      } else if ch.isNumber {
        let v = (ch.wholeNumberValue ?? 0)
        r = r * 10 + (isNegative ? -v : v)
        r = isNegative ? max(Int(Int32.min), r) : min(Int(Int32.max), r)
      } else {
        break
      }
    }
    return r
  }
  
  func test() {
    print(myAtoi("42"))
    print(myAtoi("   -42"))
    print(myAtoi("4193 with words"))
    print(myAtoi("words and 987"))
    print(myAtoi("-91283472332"))
    print(myAtoi("20000000000000000000"))
    print(myAtoi("   -42"))
  }
  
}
