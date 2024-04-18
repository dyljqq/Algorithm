//
//  463.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/18.
//

import Foundation

class Solution463 {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var cnt = 0
        
        var grids = Array(repeating: Array(repeating: 0, count: grid[0].count + 2), count: grid.count + 2)
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                grids[row + 1][col + 1] = grid[row][col]
            }
        }
        
        
        for row in 1..<(grids.count - 1) {
            for col in 1..<(grids[0].count - 1) {
                guard grids[row][col] == 1 else { continue }
                if grids[row][col - 1] == 0 {
                    cnt += 1
                }
                if grids[row][col + 1] == 0 {
                    cnt += 1
                }
                if grids[row + 1][col] == 0 {
                    cnt += 1
                }
                if grids[row - 1][col] == 0 {
                    cnt += 1
                }
            }
        }
        return cnt
    }
    
    func test() {
        print(islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]))
        print(islandPerimeter([[1]]))
        print(islandPerimeter([[1,0]]))
    }
}
