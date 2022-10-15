//
//  C1441.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/15.
//

import Foundation

class LeetcodeC1441 {
  func buildArray(_ target: [Int], _ n: Int) -> [String] {
    var stack: [Int] = []
    var p = 0
    var rs: [String] = []
    for i in 0..<n {
      if p >= target.count {
        break
      }
      stack.append(i)
      rs.append("Push")
      if target[p] == i + 1 {
        p = p + 1
      } else {
        rs.append("Pop")
      }
    }
    return rs
  }
}
