//
//  MaximalRectangle.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/7.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MaximalRectangle {
  
  func maximalRectangle(_ matrix: [[Character]]) -> Int {
    guard !matrix.isEmpty && !matrix[0].isEmpty else { return 0 }
    var res = 0
    let n = matrix.count, m = matrix[0].count
    var left = Array(repeating: 0, count: m)
    var right = Array(repeating: m, count: m)
    var height = Array(repeating: 0, count: m)
    for i in 0..<n {
      var curLeft = 0, curRight = m
      for j in 0..<m {
        if matrix[i][j] == "1" {
          height[j] += 1
          left[j] = max(curLeft, left[j])
        } else {
          curLeft = j + 1
          left[j] = 0
          height[j] = 0
        }
        
        let l = m - j - 1
        if matrix[i][l] == "1" {
          right[l] = min(curRight, right[l])
        } else {
          curRight = l
          right[l] = m
        }
      }

      for j in 0..<m {
        res = max(res, (right[j] - left[j]) * height[j])
      }
      
    }
    return res
  }
  
  func test() {
    print(maximalRectangle([
      ["1","0","1","0","0"],
      ["1","0","1","1","1"],
      ["1","1","1","1","1"],
      ["1","0","0","1","0"]
    ]))
  }
  
}
