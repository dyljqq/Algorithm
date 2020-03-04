//
//  BadOrange.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/4.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class OrangeRotting {
  
  struct Position {
    let x: Int
    let y: Int

    init(_ x: Int, _ y: Int) {
      self.x = x
      self.y = y
    }
  }
  
  func orangesRotting(_ grid: [[Int]]) -> Int {
    guard !grid.isEmpty else { return 0 }
    var grid = grid
    var freshOrangeCount = 0
    var rotedOranges: [Position] = []
    for i in 0..<grid.count {
      for j in 0..<grid[i].count {
        if grid[i][j] == 2 {
          rotedOranges.append(Position(j, i))
        } else if grid[i][j] == 1 {
          freshOrangeCount += 1
        }
      }
    }
    if freshOrangeCount == 0 {
      return 0
    } else if rotedOranges.isEmpty {
      return -1
    }
    
    var count = 0
    while !rotedOranges.isEmpty {
      for _ in 0..<rotedOranges.count {
        let pos = rotedOranges.removeFirst()
        let i = pos.y
        let j = pos.x
        if i - 1 >= 0 && grid[i - 1][j] == 1 {
          freshOrangeCount -= 1
          grid[i - 1][j] = 2
          rotedOranges.append(Position(j, i - 1))
        }
        if i + 1 < grid.count && grid[i + 1][j] == 1 {
          freshOrangeCount -= 1
          grid[i + 1][j] = 2
          rotedOranges.append(Position(j, i + 1))
        }
        if j - 1 >= 0 && grid[i][j - 1] == 1 {
          freshOrangeCount -= 1
          grid[i][j - 1] = 2
          rotedOranges.append(Position(j - 1, i))
        }
        if j + 1 < grid[i].count && grid[i][j + 1] == 1 {
          freshOrangeCount -= 1
          grid[i][j + 1] = 2
          rotedOranges.append(Position(j + 1, i))
        }
      }
      if !rotedOranges.isEmpty {
        count += 1
      }
    }
    return freshOrangeCount > 0 ? -1 : count
  }
  
  func test() {
    /**
     4
     -1
     0
     -1
     -1
     0
     -1
     */
    var arr = [[2,1,1],[1,1,0],[0,1,1]]
    print(orangesRotting(arr))

    arr = [[2,1,1],[0,1,1],[1,0,1]]
    print(orangesRotting(arr))

    arr = [[0,2]]
    print(orangesRotting(arr))

    arr = [[1],[1],[1],[1]]
    print(orangesRotting(arr))

    arr = [[0,0,0,1,1]]
    print(orangesRotting(arr))
    
    arr = [[0]]
    print(orangesRotting(arr))
    
    arr = [[2],[2],[1],[0],[1],[1]]
    print(orangesRotting(arr))
  }
}
