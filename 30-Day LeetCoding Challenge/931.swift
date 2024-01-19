//
//  931.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/19.
//

import Foundation

class Solution931 {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        var dp = Array(repeating: Array(repeating: Int.max - 1000, count: cols + 2), count: rows)
        for col in 1...cols {
            dp[0][col] = matrix[0][col - 1]
        }
        
        for row in 1..<rows {
            for col in 1...cols {
                dp[row][col] = min(min(dp[row - 1][col - 1], dp[row - 1][col]), dp[row - 1][col + 1]) + matrix[row][col - 1]
            }
        }
        
        var res = Int.max
        for col in 1...cols {
            res = min(res, dp[rows - 1][col])
        }
        return res
    }
    
    func test() {
        print(minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]]))
        print(minFallingPathSum([[-19,57],[-40,-5]]))
    }
    
}
