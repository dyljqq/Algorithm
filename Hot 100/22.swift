//
//  22.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/22.
//

import Foundation

class Leetcode22 {
  
  func dfs(left: Int, right: Int, out: String, rs: inout [String]) {
    guard left <= right else {
      return
    }
    if left == 0 && right == 0 {
      rs.append(out)
      return
    }
    if left > 0 {
      dfs(left: left - 1, right: right, out: out + "(", rs: &rs)
    }
    if right > 0 {
      dfs(left: left, right: right - 1, out: out + ")", rs: &rs)
    }
  }
  
  func generateParenthesis(_ n: Int) -> [String] {
    guard n > 0 else {
      return []
    }
    var rs: [String] = []
    dfs(left: n, right: n, out: "", rs: &rs)
    return rs
  }
  
  func test() {
    print(generateParenthesis(1))
    print(generateParenthesis(3))
  }
  
}
