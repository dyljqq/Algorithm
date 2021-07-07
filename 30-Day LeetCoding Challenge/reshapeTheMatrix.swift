//
//  reshapeTheMatrix.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/6.
//

import Foundation

class ReshapeTheMatrix {
    
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        guard !mat.isEmpty && mat.count * mat[0].count == r * c else {
            return mat
        }
        
        let matrix = mat.reduce([], +)
        return Range(uncheckedBounds: (0, r)).map { Array(matrix[($0 * c)..<(($0 + 1) * c)]) }
    }
    
    func test() {
        
        print(matrixReshape([[1,2,3,4]], 2, 2))
        
    }
    
}
