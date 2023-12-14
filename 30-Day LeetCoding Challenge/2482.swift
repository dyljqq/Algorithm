//
//  2482.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/14.
//

import Foundation

class Solution2482 {
    func onesMinusZeros(_ grid: [[Int]]) -> [[Int]] {
        var rows = Array(repeating: [0, 0], count: grid.count)
        var cols = Array(repeating: [0, 0], count: grid[0].count)
        
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == 0 {
                    rows[row][0] += 1
                } else {
                    rows[row][1] += 1
                }
            }
        }
        
        for col in 0..<grid[0].count {
            for row in 0..<grid.count {
                if grid[row][col] == 0 {
                    cols[col][0] += 1
                } else {
                    cols[col][1] += 1
                }
            }
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                dp[row][col] = rows[row][1] + cols[col][1] - rows[row][0] - cols[col][0]
            }
        }
        return dp
    }
    
    func test() {
        print(onesMinusZeros([[0,1,1],[1,0,1],[0,0,1]]))
    }
}
