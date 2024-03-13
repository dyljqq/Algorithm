//
//  2485.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/13.
//

import Foundation

class Solution2485 {
    func pivotInteger(_ n: Int) -> Int {
        let sum = (1...n).reduce(0) { $0 + $1 }
        var r = 0
        for i in 1...n {
            r += i
            if r == (sum - r + i) {
                return i
            }
        }
        return -1
    }
    
    func test() {
        print(pivotInteger(8))
        print(pivotInteger(1))
    }
}
