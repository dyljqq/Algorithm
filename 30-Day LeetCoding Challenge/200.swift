//
//  200.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/19.
//

import Foundation

class Solution200 {
    
    func dfs(row: Int, col: Int, grid: inout [[Character]]) {
        guard row >= 0 && row < grid.count && col >= 0 && col < grid[0].count && grid[row][col] == "1" else { return }
        grid[row][col] = Character("-1")
        dfs(row: row + 1, col: col, grid: &grid)
        dfs(row: row - 1, col: col, grid: &grid)
        dfs(row: row, col: col + 1, grid: &grid)
        dfs(row: row, col: col - 1, grid: &grid)
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid, cnt = 0
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == "1" {
                    dfs(row: row, col: col, grid: &grid)
                    cnt += 1
                }
            }
        }
        return cnt
    }
}
