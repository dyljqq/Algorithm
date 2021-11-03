//
//  SurroundedRegions.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/1.
//

import Foundation

class SurroundedRegions {
    
    func dfs(_ board: inout [[Character]], _ row: Int, _ column: Int, _ ch: Character) {
        if row - 1 >= 0 && board[row - 1][column] == Character("O") {
            board[row - 1][column] = ch
            dfs(&board, row - 1, column, ch)
        }
        if row + 1 < board.count && board[row + 1][column] == Character("O") {
            board[row + 1][column] = ch
            dfs(&board, row + 1, column, ch)
        }
        if column - 1 >= 0 && board[row][column - 1] == Character("O") {
            board[row][column - 1] = ch
            dfs(&board, row, column - 1, ch)
        }
        if column + 1 < board[0].count && board[row][column + 1] == Character("O") {
            board[row][column + 1] = ch
            dfs(&board, row, column + 1, ch)
        }
    }
    
    func solve(_ board: inout [[Character]]) {
        guard board.count > 2 && board[0].count > 2 else {
            return
        }
        
        for row in 0..<board.count {
            for column in 0..<board[0].count {
                if board[row][column] == Character("O") && (row == board.count - 1 || column == board[0].count - 1 || row == 0 || column == 0) {
                    board[row][column] = Character("T")
                    dfs(&board, row, column, "T")
                }
            }
        }
        for row in 0..<board.count {
            for column in 0..<board[0].count {
                if board[row][column] == Character("O") {
                    board[row][column] = Character("X")
                    dfs(&board, row, column, "X")
                }
            }
        }
        
        for row in 0..<board.count {
            for column in 0..<board[0].count {
                if board[row][column] == Character("T") {
                    board[row][column] = Character("O")
                }
            }
        }
    }
    
    func test() {
//        var board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]].map { $0.map { $0.first! } }
        var board = [["X","O","X","X"],["O","X","O","X"],["X","O","X","O"],["O","X","O","X"],["X","O","X","O"],["O","X","O","X"]].map { $0.map { $0.first! } }
        solve(&board)
        print(board)
    }
    
}
