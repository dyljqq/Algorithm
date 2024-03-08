//
//  3005.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/8.
//

import Foundation

class Solution3005 {
    func maxFrequencyElements(_ nums: [Int]) -> Int {
        var hash: [Int: Int] = [:]
        nums.forEach { num in
            hash[num, default: 0] += 1
        }
        var mx: Int = 0
        for value in hash.values {
            mx = max(mx, value)
        }
        var sum = 0
        for value in hash.values {
            if value == mx {
                sum += value
            }
        }
        return sum
    }
}
