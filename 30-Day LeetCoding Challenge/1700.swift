//
//  1700.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/8.
//

import Foundation

class Solution1700 {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var hash: [Int: Int] = [:], sandwiches = sandwiches
        students.forEach { hash[$0, default: 0] += 1 }
        for sandwich in sandwiches {
            if let value = hash[sandwich], value > 0 {
                hash[sandwich] = value - 1
            } else {
                break
            }
        }
        return hash.values.reduce(0) { $0 + $1 }
    }
    
    func test() {
        print(countStudents([1,1,0,0], [0,1,0,1]))
        print(countStudents([1,1,1,0,0,1], [1,0,0,0,1,1]))
    }
}
