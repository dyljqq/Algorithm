//
//  RottingOranges.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/29.
//

import Foundation

class RottingOranges {
    
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var queue: [(Int, Int)] = []
        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                if grid[row][column] == 2 {
                    queue.append((row, column))
                }
            }
        }
        
        var total = 0, grid = grid
        while !queue.isEmpty {
            var temp = [(Int, Int)]()
            
            for (row, column) in queue {
                grid[row][column] = -1
            }
            
            for (row, column) in queue {
                if (row - 1) >= 0 && grid[row - 1][column] == 1 {
                    temp.append((row - 1, column))
                }
                if (row + 1) < grid.count && grid[row + 1][column] == 1 {
                    temp.append((row + 1, column))
                }
                if (column - 1) >= 0 && grid[row][column - 1] == 1 {
                    temp.append((row, column - 1))
                }
                if (column + 1) < grid[0].count && grid[row][column + 1] == 1 {
                    temp.append((row, column + 1))
                }
            }
            queue = temp
            if !temp.isEmpty {
                total += 1
            }
        }

        for row in 0..<grid.count {
            for column in 0..<grid[0].count {
                if grid[row][column] == 1 {
                    return -1
                }
            }
        }
        
        return total
    }
    
    func test() {
//        print(orangesRotting([[2,1,1],[1,1,0],[0,1,1]]))
//        print(orangesRotting([[2,1,1],[0,1,1],[1,0,1]]))
//        print(orangesRotting([[0,2]]))
        print(orangesRotting([[2,2],[1,1],[0,0],[2,0]]))
    }
    
}
