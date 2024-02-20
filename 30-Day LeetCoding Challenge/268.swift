//
//  268.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/20.
//

import Foundation

class Solution268 {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let sum = nums.reduce(0) { $0 + $1 }
        return (n * (n + 1)) / 2 - sum
    }
}
