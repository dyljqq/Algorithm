//
//  14.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/20.
//

import Foundation

class Leetcode14 {
  
  func helper(_ str1: String, _ str2: String) -> String {
    var rs: [String.Element] = []
    let a1 = Array(str1), a2 = Array(str2)
    for i in 0..<min(str1.count, str2.count) {
      if a1[i] != a2[i] {
        break
      }
      rs.append(a1[i])
    }
    return String(rs)
  }
  
  func longestCommonPrefix(_ strs: [String]) -> String {
    guard !strs.isEmpty else {
      return ""
    }
    
    var checkedStr = strs[0]
    for str in strs.dropFirst() {
      checkedStr = helper(checkedStr, str)
      if checkedStr.isEmpty {
        return ""
      }
    }
    return checkedStr
  }
  
  func test() {
    print(longestCommonPrefix(["flower","flow","flight"]))
    print(longestCommonPrefix(["dog","racecar","car"]))
  }
  
}
