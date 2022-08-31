//
//  417.swift
//  Leetcode
//
//  Created by jiqinqiang on 2022/8/31.
//

import Foundation

class Leetcode417 {
  
  func dfs(_ i: Int, _ j: Int, _ val: Int, _ heights: [[Int]], _ visited: inout [[Int]]) {
    guard i >= 0 && j >= 0 && i < heights.count && j < heights[0].count && visited[i][j] == 0 && heights[i][j] >= val else {
      return
    }
    
    visited[i][j] = 1
    dfs(i + 1, j, heights[i][j], heights, &visited)
    dfs(i - 1, j, heights[i][j], heights, &visited)
    dfs(i, j + 1, heights[i][j], heights, &visited)
    dfs(i, j - 1, heights[i][j], heights, &visited)
  }
  
  func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
    var p = Array(repeating: Array(repeating: 0, count: heights[0].count), count: heights.count)
    var q = Array(repeating: Array(repeating: 0, count: heights[0].count), count: heights.count)
    
    for i in 0..<heights[0].count {
      dfs(0, i, -1, heights, &p)
      dfs(heights.count - 1, i, -1, heights, &q)
    }
    
    for j in 0..<heights.count {
      dfs(j, 0, -1, heights, &p)
      dfs(j, heights[0].count - 1, -1, heights, &q)
    }
    
    var rs: [[Int]] = []
    for row in 0..<heights.count {
      for col in 0..<heights[0].count {
        if p[row][col] == 1 && q[row][col] == 1{
          rs.append([row, col])
        }
      }
    }
    
    return rs
  }
  
  func test() {
    print(pacificAtlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]))
    print(pacificAtlantic([[1]]))
  }
  
}
