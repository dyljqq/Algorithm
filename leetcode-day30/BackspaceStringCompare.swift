//
//  BackspaceStringCompare.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/10.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class BackspaceStringCompare {
  
  func helper(_ i: Int, _ arr: inout [Character]) -> Int {
    guard i >= 0 && i < arr.count else {
      return 201
    }
    if arr[i] == Character("#") {
      let mn = min(arr.count, 2)
      let j = max(0, i - mn + 1)
      arr.removeSubrange(j...i)
      return j
    }
    return i + 1
  }
  
  func backspaceCompare(_ S: String, _ T: String) -> Bool {
    var s = Array(S), t = Array(T)
    let mx = max(s.count, t.count)
    var cnt = 0
    var i = 0, j = 0
    while cnt < mx {
      i = helper(i, &s)
      j = helper(j, &t)
      cnt += 1
    }
    return s.count == t.count && String(s) == String(t)
  }
  
  func test() {
    print(backspaceCompare("ab#c", "ad#c"))
    print(backspaceCompare("ab##", "c#d#"))
    print(backspaceCompare("a##c", "#a#c"))
    print(backspaceCompare("a#c", "b"))
  }
  
}
