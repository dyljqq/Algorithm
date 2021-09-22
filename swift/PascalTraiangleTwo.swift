//
//  PascalTraiangleTwo.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/22.
//

import Foundation

class PascalTraiangleTwo {
    
    func generate(_ numRows: Int) -> [[Int]] {
        var results = [[Int]]()
        guard numRows > 0 else {
            return results
        }
        
        results.append([1])
        for row in 1..<numRows {
            var temps: [Int] = [1]
            let last = results.last!
            for i in 1..<row {
                temps.append(last[i] + last[i - 1])
            }
            temps.append(1)
            results.append(temps)
        }
        return results
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex <= 33 else {
            return []
        }
        let triangles = generate(34)
        return triangles[rowIndex]
    }
    
    func test() {
        print(getRow(3))
        print(getRow(0))
        print(getRow(1))
    }
    
}
