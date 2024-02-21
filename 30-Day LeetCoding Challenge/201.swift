//
//  201.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/21.
//

import Foundation

class Solution201 {
    
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var right = right
        while left < right {
            // 去除最低位的1
            right = right & (right - 1)
        }
        return right
    }
    
    func test() {
        print(rangeBitwiseAnd(5, 8))
        print(rangeBitwiseAnd(2, 7))
        print(rangeBitwiseAnd(5, 7))
        print(rangeBitwiseAnd(1, 2147483647))
        print(rangeBitwiseAnd(0, 0))
    }
}
