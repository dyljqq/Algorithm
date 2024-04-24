//
//  1137.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/24.
//

import Foundation

class Solution1137 {
    func tribonacci(_ n: Int) -> Int {
        var array = Array(repeating: 0, count: 38)
        array[1] = 1
        array[2] = 1
        guard n >= 3 else { return array[n] }
        for i in 3...n {
            array[i] = array[i - 2] + array[i - 1] + array[i - 3]
        }
        return array[n]
    }
    
    func test() {
        print(tribonacci(3))
        print(tribonacci(4))
        print(tribonacci(0))
    }
}
