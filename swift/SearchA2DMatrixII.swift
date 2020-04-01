//
//  SearchA2DMatrixII.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/1.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class SearchA2DMatrixII {
  
  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !matrix.isEmpty else {
      return false
    }
    
    var row = 0
    var col = matrix[0].count - 1
    while row < matrix.count && col >= 0 {
      let val = matrix[row][col]
      if target == val {
        return true
      } else if target > val {
        row += 1
      } else {
        col -= 1
      }
    }
    return false
  }
  
  func test() {
    let arr = [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    print(searchMatrix(arr, 5))
    print(searchMatrix(arr, 20))
  }
  
}
