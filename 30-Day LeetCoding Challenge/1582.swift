//
//  1582.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/13.
//

import Foundation

class Solution1582 {
    
    func check(row: Int, col: Int, mat: [[Int]]) -> Bool {
        for i in 0..<mat.count {
            if mat[i][col] == 1, i != row {
                return false
            }
        }
        
        for i in 0..<mat[0].count {
            if mat[row][i] == 1, i != col {
                return false
            }
        }
        
        return true
    }
    
    func numSpecial(_ mat: [[Int]]) -> Int {
        var cnt = 0
        for row in 0..<mat.count {
            for col in 0..<mat[0].count {
                if mat[row][col] == 1, check(row: row, col: col, mat: mat) {
                    cnt += 1
                    break
                }
            }
        }
        return cnt
    }
    
    func test() {
        print(numSpecial([[1,0,0],[0,0,1],[1,0,0]]))
        print(numSpecial([[1,0,0],[0,1,0],[0,0,1]]))
        print(numSpecial([[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,1],[0,0,0,0,1,0,0,0],[1,0,0,0,1,0,0,0],[0,0,1,1,0,0,0,0]]))
    }
}
