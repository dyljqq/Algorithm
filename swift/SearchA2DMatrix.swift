//
//  SearchA2DMatrix.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/1.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class SearchA2DMatrix {
  
  func helper(_ target: Int, _ nums: [Int]) -> Bool {
    var p = 0
    var q = nums.count
    while p < q {
      let mid = (p + q) / 2
      if target == nums[mid] {
        return true
      } else if target > nums[mid] {
        p = mid + 1
      } else {
        q = mid
      }
    }
    return false
  }
  
//  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//    guard !(matrix.isEmpty || matrix[0].isEmpty) else { return false }
//
//    for i in stride(from: matrix.count - 1, to: -1, by: -1) {
//      let col = matrix[0].count - 1
//      let checkval = matrix[i][col]
//      if target == checkval {
//        return true
//      } else if target > checkval {
//        if i == matrix.count - 1 {
//          return false
//        } else {
//          return helper(target, matrix[i + 1])
//        }
//      } else if i == 0 {
//        return helper(target, matrix[0])
//      }
//    }
//
//    return false
//  }
  
  func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard !(matrix.isEmpty || matrix[0].isEmpty) else { return false }
    var p = 0
    var q = matrix.count * matrix[0].count
    while p < q {
      let mid = (p + q) / 2
      let i = mid / matrix[0].count
      let j = mid % matrix[0].count
      let val = matrix[i][j]
      if val == target {
        return true
      } else if val > target {
        q = mid
      } else {
        p = mid + 1
      }
    }
    return false
  }
  
  func test() {
//    let matrix = [
//      [1,   3,  5,  7],
//      [10, 11, 16, 20],
//      [23, 30, 34, 50]
//    ]
    let matrix: [[Int]] = [[1]]
    print(searchMatrix(matrix, 1))
    print(searchMatrix(matrix, 13))
  }
  
}
