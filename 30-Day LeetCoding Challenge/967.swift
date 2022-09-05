//
//  967.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/3.
//

import Foundation

class Leetcode967 {
  
  func dfs(_ cur: Int, _ n: Int, _ k: Int, _ res: inout [Int]) {
    guard n > 0 else {
      res.append(cur)
      return
    }
    let last = cur % 10
    if (last + k) <= 9 {
      dfs(cur * 10 + last + k, n - 1, k, &res)
    }
    if (last - k) >= 0 {
      dfs(cur * 10 + last - k, n - 1, k, &res)
    }
  }
  
  func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
    var res = [Int]()
    for i in 1..<10 {
      dfs(i, n - 1, k, &res)
    }
    return Array(Set(res))
  }
  
  func test() {
    print(numsSameConsecDiff(3, 7))
    print(numsSameConsecDiff(2, 1))
  }
  
}
