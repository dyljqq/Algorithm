//
//  O29.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/18.
//

import Foundation

class LeetCodeO29 {
  
  func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty else { return [] }
    var results = [Int]()
    var rs = 0, re = matrix.count - 1, cs = 0, ce = matrix[0].count - 1
    while true {
      for col in cs...ce {
        results.append(matrix[rs][col])
      }
      rs += 1
      if rs > re {
        break
      }

      for row in rs...re {
        results.append(matrix[row][ce])
      }
      ce -= 1
      if cs > ce {
        break
      }

      for col in stride(from: ce, to: cs - 1, by: -1) {
        results.append(matrix[re][col])
      }
      re -= 1
      if rs > re {
        break
      }

      for row in stride(from: re, to: rs - 1, by: -1) {
        results.append(matrix[row][cs])
      }
      cs += 1
      if cs > ce {
        break
      }
    }
    return results
  }
  
  func test() {
    print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
    print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
  }
  
}
