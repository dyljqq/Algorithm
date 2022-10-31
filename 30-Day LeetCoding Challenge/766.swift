//
//  766.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/10/31.
//

import Foundation

// https://leetcode.com/problems/toeplitz-matrix/
class Leetcode766 {
  func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
    for row in 0..<matrix.count {
      for column in 0..<matrix[0].count {
        if (row + 1) < matrix.count && (column + 1) < matrix[0].count && matrix[row + 1][column + 1] != matrix[row][column] {
          return false
        }
      }
    }
    return true
  }
}
