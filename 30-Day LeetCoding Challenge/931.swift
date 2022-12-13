//
//  931.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/12/13.
//

import Foundation

class Leetcode931 {
  func minFallingPathSum(_ matrix: [[Int]]) -> Int {
    guard !matrix.isEmpty else { return 0 }
    
    var matrix = matrix
    let rs: [Int]
    if matrix.count > 1 {
      for row in 1..<matrix.count {
        for col in 0..<matrix[row].count {
          var mn = matrix[row - 1][col]
          if col >= 1 {
            mn = min(mn, matrix[row - 1][col - 1])
          }
          if col < (matrix.count - 1) {
            mn = min(mn, matrix[row - 1][col + 1])
          }
          matrix[row][col] += mn
        }
      }
      rs = matrix.last!
    } else {
      rs = matrix[0]
    }
    
    var mn = Int.max
    rs.forEach { mn = min(mn, $0) }
    return mn
  }
  
  func test() {
    print(minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]]))
    print(minFallingPathSum([[-19,57],[-40,-5]]))
  }
}
