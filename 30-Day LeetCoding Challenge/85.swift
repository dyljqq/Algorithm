//
//  85.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/30.
//

import Foundation

class Leetcode85 {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let m = matrix.count, n = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        for row in 0..<m {
            for column in 0..<n {
                if matrix[row][column] == Character("1") {
                    dp[row][column] = column == 0 ? 1 : (dp[row][column - 1] + 1)
                } else {
                    dp[row][column] = 0
                }
            }
        }
        
        var ans = Int.min
        for row in 0..<m {
            for column in 0..<n {
                var len = Int.max
                for k in row..<m {
                    len = min(len, dp[k][column])
                    if len == 0 {
                        break
                    }
                    ans = max(len * (k - row + 1), ans)
                }
            }
        }
        return ans
    }
    
    func test() {
        let matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
        print(maximalRectangle(matrix.map { $0.map { Character($0) } }))
    }
}
