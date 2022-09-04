//
//  1582.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/9/4.
//

import Foundation

class Leetcode1582 {
  
  func numSpecial(_ mat: [[Int]]) -> Int {
    var rows = Array(repeating: 0, count: mat.count), columns = Array(repeating: 0, count: mat[0].count)
    
    for row in 0..<mat.count {
      for col in 0..<mat[0].count {
        if mat[row][col] == 1 {
          rows[row] += 1
          columns[col] += 1
        }
      }
    }
    
    var cnt = 0
    for row in 0..<mat.count {
      for col in 0..<mat[0].count {
        if mat[row][col] == 1 && rows[row] == 1 && columns[col] == 1 {
          cnt += 1
        }
      }
    }
    
    return cnt
  }
  
  func test() {
    print(numSpecial([[1,0,0],[0,0,1],[1,0,0]]))
    print(numSpecial([[1,0,0],[0,1,0],[0,0,1]]))
  }
  
}
