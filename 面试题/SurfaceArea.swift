//
//  SurfaceArea.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/25.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class SurfaceArea {
  
  func surfaceArea(_ grid: [[Int]]) -> Int {
    var total = 0
    var cover = 0
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if i > 0 {
          cover += min(grid[i][j], grid[i - 1][j])
        }
        if j > 0 {
          cover += min(grid[i][j - 1], grid[i][j])
        }
        cover += max((grid[i][j] - 1), 0)
        total += grid[i][j]
      }
    }
    return total * 6 - cover * 2
  }
  
  func test() {
//    print(surfaceArea([[2]]))
//    print(surfaceArea([[1, 2], [3, 4]]))
    print(surfaceArea([[1,0],[0,2]]))
    print(surfaceArea([[1,1,1],[1,0,1],[1,1,1]]))
  }
  
}
