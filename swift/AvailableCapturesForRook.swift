//
//  File.swift
//  LeetCode
//
//  Created by 季勤强 on 2020/3/26.
//  Copyright © 2020 dyljqq. All rights reserved.
//

import Foundation

class AvailableCapturesForRook {
  
  enum Direction {
    case left
    case right
    case up
    case down
  }
  
  func helper(_ i: Int, _ j: Int, _ direction: Direction, _ board: [[Character]]) -> Int {
    guard (i >= 0 && i < board.count && j >= 0 && j < board[0].count) else {
      return 0
    }
    if board[i][j] == Character("B") {
      return 0
    } else if board[i][j] == Character("p") {
      return 1
    }
    switch direction {
    case .left:
      return helper(i - 1, j, direction, board)
    case .right:
      return helper(i + 1, j, direction, board)
    case .up:
      return helper(i, j - 1, direction, board)
    case .down:
      return helper(i, j + 1, direction, board)
    }
  }
  
  func numRookCaptures(_ board: [[Character]]) -> Int {
    for i in 0..<board.count {
      for j in 0..<board[0].count {
        if board[i][j] == Character("R") {
          return helper(i, j, .left, board) + helper(i, j, .right, board) + helper(i, j, .down, board) + helper(i, j, .up, board)
        }
      }
    }
    return 0
  }
  
  func test() {
    
  }
  
}
