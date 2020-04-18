//
//  MinimumPathSum.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/4/18.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class MinimumPathSum {
  
//  func minPathSum(_ grid: [[Int]]) -> Int {
//    guard !(grid.isEmpty || grid[0].isEmpty) else { return 0 }
//    let n = grid.count, m = grid[0].count
//    var dp = Array(repeating: Array(repeating: Int.max, count: grid[0].count), count: grid.count)
//    dp[0][0] = grid[0][0]
//
//    var stack = [(0, 0)]
//    while !stack.isEmpty {
//      for _ in 0..<stack.count {
//        let (l, k) = stack.removeFirst()
//        if l + 1 < n {
//          if dp[l + 1][k] == Int.max {
//            stack.append((l + 1, k))
//          }
//          dp[l + 1][k] = min(dp[l + 1][k], dp[l][k] + grid[l + 1][k])
//        }
//        if k + 1 < m {
//          if dp[l][k + 1] == Int.max {
//            stack.append((l, k + 1))
//          }
//          dp[l][k + 1] = min(dp[l][k + 1], dp[l][k] + grid[l][k + 1])
//        }
//      }
//    }
//    return dp[n - 1][m - 1]
//  }
  
  func minPathSum(_ grid: [[Int]]) -> Int {
    guard !(grid.isEmpty || grid[0].isEmpty) else { return 0 }
    var grid = grid
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if i == 0 && j == 0 {
          continue
        } else if i == 0 {
          grid[0][j] += grid[0][j - 1]
        } else if j == 0 {
          grid[i][0] += grid[i - 1][0]
        } else {
          grid[i][j] += min(grid[i - 1][j], grid[i][j - 1])
        }
      }
    }
    return grid[grid.count - 1][grid[0].count - 1]
  }
  
  func test() {
    var arr = [
      [1,3,1],
      [1,5,1],
      [4,2,1]
    ]
    arr = [[1,2,5],[3,2,1]]
    print(minPathSum(arr))
  }
  
}
