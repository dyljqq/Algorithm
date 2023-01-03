//
//  944.swift
//  Leetcode
//
//  Created by jiqinqiang on 2023/1/3.
//

import Foundation

class Leetcode944 {
  func minDeletionSize(_ strs: [String]) -> Int {
    var cnt = 0
    let strs = strs.map { Array($0) }
    
    for i in 0..<strs[0].count {
      for j in 1..<strs.count {
        if strs[j][i] < strs[j - 1][i] {
          cnt += 1
          break
        }
      }
    }
    return cnt
  }
  
  func test() {
    print(minDeletionSize(["cba","daf","ghi"]))
    print(minDeletionSize(["a","b"]))
    print(minDeletionSize(["zyx","wvu","tsr"]))
    print(minDeletionSize(["rrjk","furt","guzm"]))
  }
}
