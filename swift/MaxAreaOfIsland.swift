//
//  MaxAreaOfIsland.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/15.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MaxAreaOfIsland {
  
  func bfs(_ x: Int, _ y: Int, _ nums: inout [[Int]]) -> Int {
    var temp: [(Int, Int)] = []
    temp.append((x, y))
    nums[x][y] = 0
    
    var res = 0
    while !temp.isEmpty {
      let (x, y) = temp.removeFirst()
      res += 1
      
      if x - 1 >= 0 && nums[x - 1][y] == 1 {
        temp.append((x - 1, y))
        nums[x - 1][y] = 0
      }
      if x + 1 < nums.count && nums[x + 1][y] == 1 {
        temp.append((x + 1, y))
        nums[x + 1][y] = 0
      }
      if y - 1 >= 0 && nums[x][y - 1] == 1 {
        temp.append((x, y - 1))
        nums[x][y - 1] = 0
      }
      if y + 1 < nums[0].count && nums[x][y + 1] == 1 {
        temp.append((x, y + 1))
        nums[x][y + 1] = 0
      }
    }
    return res
  }

  func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    guard !grid.isEmpty else { return 0 }
    
    var res = 0
    var grid = grid
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == 1 {
          res = max(res, bfs(i, j, &grid))
        }
      }
    }
    
    return res
  }
  
  func test() {
//    print(maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],
//     [0,0,0,0,0,0,0,1,1,1,0,0,0],
//     [0,1,1,0,1,0,0,0,0,0,0,0,0],
//     [0,1,0,0,1,1,0,0,1,0,1,0,0],
//     [0,1,0,0,1,1,0,0,1,1,1,0,0],
//     [0,0,0,0,0,0,0,0,0,0,1,0,0],
//     [0,0,0,0,0,0,0,1,1,1,0,0,0],
//     [0,0,0,0,0,0,0,1,1,0,0,0,0]]))
//    print(maxAreaOfIsland([[0,0,0,0,0,0,0,0]]))
    print(maxAreaOfIsland([[1,1,0,0,0],[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,1]]))
  }
  
}
