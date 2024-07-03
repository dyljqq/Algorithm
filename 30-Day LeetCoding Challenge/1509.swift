//
//  1509.swift
//  Leetcode
//
//  Created by polaris dev on 2024/7/3.
//

import Foundation

class Solution1509 {
    func minDifference(_ nums: [Int]) -> Int {
        guard nums.count > 4 else { return 0 }
        let nums = nums.sorted()
        let n = nums.count
        let values = [
            nums[n - 1] - nums[3],
            nums[n - 2] - nums[2],
            nums[n - 3] - nums[1],
            nums[n - 4] - nums[0]
        ]
        return values.sorted().first ?? 0
    }
}
