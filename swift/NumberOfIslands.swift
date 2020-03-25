//
//  NumberOfIslands.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/25.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class NumberOfIslands {
  
  func dfs(_ i: Int, _ j: Int, _ grid: inout [[Character]]) {
    guard !grid.isEmpty && (i >= 0 && i < grid.count)
      && (j >= 0 && j < grid[0].count)
      && grid[i][j] == Character("1") else { return }
    grid[i][j] = Character("0")
    dfs(i - 1, j, &grid)
    dfs(i + 1, j, &grid)
    dfs(i, j - 1, &grid)
    dfs(i, j + 1, &grid)
  }
  
  func numIslands(_ grid: [[Character]]) -> Int {
    var count = 0
    var grid = grid
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == Character("1") {
          dfs(i, j, &grid)
          count += 1
        }
      }
    }
    return count
  }
  
  func test() {
    
  }
  
}
