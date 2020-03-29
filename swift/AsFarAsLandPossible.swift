//
//  AsFarAsLandPossible.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/29.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class AsFarAsLandPossible {
  
  func maxDistance(_ grid: [[Int]]) -> Int {
    guard !grid.isEmpty else {
      return 0
    }
    
    var hasOcean = false
    var queue: [(Int, Int)] = []
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == 1 {
          queue.append((i, j))
        } else if !hasOcean {
          hasOcean = true
        }
      }
    }
    
    var grid = grid
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, 1, -1]
    var end: (Int, Int) = (-1, -1)
    while !queue.isEmpty {
      end = queue.removeFirst()
      for i in 0..<dx.count {
        let y = end.0 + dy[i]
        let x = end.1 + dx[i]
        if x < 0 || x >= grid[0].count || y < 0 || y >= grid.count || grid[y][x] != 0 {
          continue
        }
        grid[y][x] = grid[end.0][end.1] + 1
        queue.append((y, x))
      }
    }
    return end.0 != -1 && hasOcean ? (grid[end.0][end.1] - 1) : -1
  }
  
  func test() {
//    print(maxDistance([[1,0,1],[0,0,0],[1,0,1]]))
//    print(maxDistance([[1,0,0],[0,0,0],[0,0,0]]))
    print(maxDistance([[1,0,0,0,0,1,0,0,0,1],[1,1,0,1,1,1,0,1,1,0],[0,1,1,0,1,0,0,1,0,0],[1,0,1,0,1,0,0,0,0,0],[0,1,0,0,0,1,1,0,1,1],[0,0,1,0,0,1,0,1,0,1],[0,0,0,1,1,1,1,0,0,1],[0,1,0,0,1,0,0,1,0,0],[0,0,0,0,0,1,1,1,0,0],[1,1,0,1,1,1,1,1,0,0]]))
  }
  
}
