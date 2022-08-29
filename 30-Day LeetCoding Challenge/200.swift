//
//  200.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/29.
//

import Foundation

class Leetcode200 {
  
  func helper(_ i: Int, _ j: Int, _ grid: inout [[Character]]) {
    guard i >= 0 && i < grid.count && j >= 0 && j < grid[0].count && grid[i][j] == "1" else {
      return
    }
    
    grid[i][j] = "0"
    helper(i + 1, j, &grid)
    helper(i, j + 1, &grid)
    helper(i - 1, j, &grid)
    helper(i, j - 1, &grid)
  }
  
  func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid, cnt = 0
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == "1" {
          cnt += 1
          helper(i, j, &grid)
        }
      }
    }
    
    return cnt
  }
  
  func test() {
    print(numIslands([
      ["1","1","1","1","0"],
      ["1","1","0","1","0"],
      ["1","1","0","0","0"],
      ["0","0","0","0","0"]
    ]))
    
    print(numIslands([
      ["1","1","0","0","0"],
      ["1","1","0","0","0"],
      ["0","0","1","0","0"],
      ["0","0","0","1","1"]
    ]))
  }
  
}
