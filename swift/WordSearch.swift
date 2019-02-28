//
//  WordSearch.swift
//  LeetCode
//
//  Created by 季勤强 on 2019/2/27.
//  Copyright © 2019 dyljqq. All rights reserved.
//

import Foundation

class WordSearch {
  func exist(_ board: [[Character]], _ word: String) -> Bool {
    if board.count == 0 {
      return false
    }
    
    let n = board.count
    let m = board[0].count
    let chars = Array(word)
    var visited = [[Bool]](repeatElement([Bool](repeatElement(false, count: m)), count: n))
    
    for i in 0..<n {
      for j in 0..<m {
        if board[i][j] == chars[0] &&
          backtracking(board, chars, i, j, 0, &visited)
        {
          return true
        }
      }
    }
    
    return false
  }
  
  func backtracking(_ board: [[Character]], _ chars: [Character], _ i: Int, _ j: Int, _ index: Int, _ visited: inout [[Bool]]) -> Bool {
    if index == chars.count {
      return true
    }
    
    let n = board.count
    let m = board[0].count
    
    if i < 0 || i >= n || j < 0 || j >= m || board[i][j] != chars[index] || visited[i][j] {
      return false
    }
    
    visited[i][j] = true
    if backtracking(board, chars, i - 1, j,     index + 1, &visited) ||
      backtracking(board, chars, i + 1, j,     index + 1, &visited) ||
      backtracking(board, chars, i,     j - 1, index + 1, &visited) ||
      backtracking(board, chars, i,     j + 1, index + 1, &visited) {
      return true
    }
    visited[i][j] = false
    
    return false
  }
  
  func test() {
    let str = "ABCESFCSADEE"
    var board = [[Character]]()
    var b = [Character]()
    for (i, c) in str.enumerated() {
      if i > 0 && i % 4 == 0 {
        board.append(b)
        b = [Character]()
      }
      b.append(c)
    }
    board.append(b)
    print(exist(board, "ABCCED"))
    print(exist(board, "SEE"))
    print(exist(board, "ABCB"))
  }
}
