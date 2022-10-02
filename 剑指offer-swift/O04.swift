//
//  O04.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/2.
//

import Foundation

class LeetcodeO04 {
  
  func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty else {
      return false
    }
    var col = matrix[0].count - 1, row = 0
    while row < matrix.count && col >= 0 {
      let v = matrix[row][col]
      if v > target {
        col = col - 1
      } else if v < target {
        row = row + 1
      } else {
        return true
      }
    }
    return false
  }
  
  func test() {
    print(findNumberIn2DArray([
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ], 5))
    print(findNumberIn2DArray([
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ], 20))
  }
  
}
