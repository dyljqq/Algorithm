//
//  947.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/11/14.
//

import Foundation

// 947. Most Stones Removed with Same Row or Column
// https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/
// use union find
class Leetcode947 {
  
  func removeStones(_ stones: [[Int]]) -> Int {
    let n = stones.count
    var root: [Int] = []
    (0..<n).forEach { root.append($0) }
    
    for i in 0..<n {
      for j in (i + 1)..<n {
        if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
          root[getRoot(i, root: &root)] = getRoot(j, root: &root)
        }
      }
    }
    
    var cnt = 0
    for i in  0..<n {
      if i == root[i] {
        cnt += 1
      }
    }
    return n - cnt
  }
  
  func getRoot(_ x: Int, root: inout [Int]) -> Int {
    return x == root[x] ? x : getRoot(root[x], root: &root)
  }
  
  func test() {
//    print(removeStones([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]))
    print(removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]]))
  }
}
