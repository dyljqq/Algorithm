//
//  576.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/26.
//

import Foundation

class Solution576 {
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int,_ startRow: Int, _ startColumn: Int) -> Int {
        guard maxMove > 0 else { return 0 }
        let mod = 1000000007
        var dp = Array(repeating: Array(repeating: 0, count: maxMove + 1), count: m * n)
        let dirs = [0, 1, 0, -1, 0]
        
        func inBounds(_ x: Int, _ y: Int) -> Bool {
            return x >= 0 && x < m && y >= 0 && y < n
        }
        
        for k in 1...maxMove {
            for x in 0..<m {
                for y in 0..<n {
                    for d in 0..<4 {
                        let nx = x + dirs[d]
                        let ny = y + dirs[d+1]
                        
                        if inBounds(nx, ny) {
                            dp[x*n+y][k] += dp[nx*n+ny][k-1]
                            dp[x*n+y][k] %= mod
                        } else {
                            dp[x*n+y][k] += 1
                        }
                    }
                }
            }
        }
        
        return dp[startRow*n+startColumn][maxMove]
    }

    func test() {
//        print(findPaths(2, 2, 2, 0, 0))
//        print(findPaths(1, 3, 3, 0, 1))
        print(findPaths(2, 3, 8, 1, 0))
        print(findPaths(10, 10, 0, 5, 5))
    }
}
