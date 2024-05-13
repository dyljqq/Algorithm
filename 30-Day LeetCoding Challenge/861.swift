//
//  861.swift
//  Leetcode
//
//  Created by polaris dev on 2024/5/13.
//

import Foundation

//You are given an m x n binary matrix grid.
//
//A move consists of choosing any row or column and toggling each value in that row or column (i.e., changing all 0's to 1's, and all 1's to 0's).
//
//Every row of the matrix is interpreted as a binary number, and the score of the matrix is the sum of these numbers.
//
//Return the highest possible score after making any number of moves (including zero moves).

class Solution861 {
    func matrixScore(_ grid: [[Int]]) -> Int {
        var grid = grid, sum = 0
        for row in 0..<grid.count {
            if grid[row][0] == 0 {
                for column in 0..<grid[0].count {
                    grid[row][column] = 1 - grid[row][column]
                }
            }
        }
        
        for column in 1..<grid[0].count {
            let sumOfOne = (0..<grid.count).reduce(0) { $0 + grid[$1][column] }
            if sumOfOne < (grid.count - sumOfOne) {
                (0..<grid.count).forEach { grid[$0][column] = 1 - grid[$0][column] }
            }
        }
        
        for row in 0..<grid.count {
            var temp = 0, mul = 1
            for column in stride(from: grid[0].count - 1, to: -1, by: -1) {
                temp += grid[row][column] * mul
                mul *= 2
            }
            sum += temp
        }
        return sum
    }
    
    func test() {
        print(matrixScore([[0,0,1,1],[1,0,1,0],[1,1,0,0]]))
    }
}
