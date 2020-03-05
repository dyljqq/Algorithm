//
//  RotateImage.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/5.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class RotateImage {
  func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for i in 0..<n {
      for j in 0..<i {
        let temp = matrix[i][j]
        matrix[i][j] = matrix[j][i]
        matrix[j][i] = temp
      }
    }
    
    for i in 0..<n {
      for j in 0..<Int(n / 2) {
        let temp = matrix[i][n - j - 1]
        matrix[i][n - j - 1] = matrix[i][j]
        matrix[i][j] = temp
      }
    }
  }
  
  func test() {
    var arr = [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]
    rotate(&arr)
    for a in arr {
      print(a)
    }
    
    arr = [
      [5, 1, 9,11],
       [ 2, 4, 8,10],
       [13, 3, 6, 7],
       [15,14,12,16]
    ]
    rotate(&arr)
    for a in arr {
      print(a)
    }
  }
}
