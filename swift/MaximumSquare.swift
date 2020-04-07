//
//  MaximumSquare.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/7.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MaximumSquare {
  
  func maximalSquare(_ matrix: [[Character]]) -> Int {
    guard !matrix.isEmpty && !matrix[0].isEmpty else { return 0 }
    
    var res = 0
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
    for i in 0..<matrix.count {
      for j in 0..<matrix[0].count {
        if i == 0 || j == 0 || matrix[i][j] == "0" {
          dp[i][j] = matrix[i][j] == "1" ? 1 : 0
        } else {
          dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
        }
        res = max(res, dp[i][j])
      }
    }
    return res * res
  }
  
  func test() {
    print(maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))
    print(maximalSquare(convert([["0","0","0","1"],["1","1","0","1"],["1","1","1","1"],["0","1","1","1"],["0","1","1","1"]])))
    print(maximalSquare([["1"]]))
    print(maximalSquare([["0"]]))
    print(maximalSquare([["1","0","1","0","0","1","1","1","0"],["1","1","1","0","0","0","0","0","1"],["0","0","1","1","0","0","0","1","1"],["0","1","1","0","0","1","0","0","1"],["1","1","0","1","1","0","0","1","0"],["0","1","1","1","1","1","1","0","1"],["1","0","1","1","1","0","0","1","0"],["1","1","1","0","1","0","0","0","1"],["0","1","1","1","1","0","0","1","0"],["1","0","0","1","1","1","0","0","0"]]))
  }
  
  func convert(_ arr: [[String]]) -> [[Character]] {
    return arr.map { $0.map { Character($0) } }
  }
  
}
