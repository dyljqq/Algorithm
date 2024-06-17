//
//  633.swift
//  Leetcode
//
//  Created by polaris dev on 2024/6/17.
//

import Foundation

class Solution633 {
    func judgeSquareSum(_ c: Int) -> Bool {
        var left = 0, right = Int(sqrt(Double(c)))
        while left <= right {
            let current = left * left + right * right
            if current == c {
                return true
            } else if current < c {
                left += 1
            } else {
                right -= 1
            }
        }
        return false
    }
    
    func test() {
        print(judgeSquareSum(6))
    }
}
