//
//  1219.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/14.
//

import Foundation

class Solution1219 {
    
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        var grid = grid
        var maxGold = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                maxGold = max(maxGold, dfs(&grid, i, j))
            }
        }
        return maxGold
    }
    
    func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Int {
        if i < 0 || j < 0 || i == grid.count || j == grid[i].count || grid[i][j] == 0 {
            return 0
        }
        let temp = grid[i][j]
        grid[i][j] = 0
        var maxGold = 0
        for d in 0..<4 {
            maxGold = max(maxGold, dfs(&grid, i + dx[d], j + dy[d]))
        }
        grid[i][j] = temp
        return maxGold + temp
    }
    
    func test() {
        print(getMaximumGold([[0,6,0],[5,8,7],[0,9,0]])) // 24
        print(getMaximumGold([[1,0,7],[2,0,6],[3,4,5],[0,3,0],[9,0,20]])) // 28
        print(getMaximumGold([[1,0,7,0,0,0],[2,0,6,0,1,0],[3,5,6,7,4,2],[4,3,1,0,2,0],[3,0,5,0,20,0]])) // 60
        print(getMaximumGold([[0,0,0,22,0,24],[34,23,18,0,23,2],[11,39,20,12,0,0],[39,8,0,2,0,1],[19,32,26,20,20,30],[0,38,26,0,29,31]])) // 478
    }
}

//In a gold mine grid of size m x n, each cell in this mine has an integer representing the amount of gold in that cell, 0 if it is empty.
//
//Return the maximum amount of gold you can collect under the conditions:
//
//Every time you are located in a cell you will collect all the gold in that cell.
//From your position, you can walk one step to the left, right, up, or down.
//You can't visit the same cell more than once.
//Never visit a cell with 0 gold.
//You can start and stop collecting gold from any position in the grid that has some gold.
// 
//
//Example 1:
//
//Input: grid = [[0,6,0],[5,8,7],[0,9,0]]
//Output: 24
//Explanation:
//[[0,6,0],
// [5,8,7],
// [0,9,0]]
//Path to get the maximum gold, 9 -> 8 -> 7.
//Example 2:
//
//Input: grid = [[1,0,7],[2,0,6],[3,4,5],[0,3,0],[9,0,20]]
//Output: 28
//Explanation:
//[[1,0,7],
// [2,0,6],
// [3,4,5],
// [0,3,0],
// [9,0,20]]
//Path to get the maximum gold, 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7.
// 
//
//Constraints:
//
//m == grid.length
//n == grid[i].length
//1 <= m, n <= 15
//0 <= grid[i][j] <= 100
//There are at most 25 cells containing gold.
