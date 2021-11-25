//
//  53.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/25.
//

import Foundation

/// 53. Maximum Subarray
/// https://leetcode.com/problems/maximum-subarray/
class Leetcode53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0, mx = Int.min
        for num in nums {
            if sum < 0 {
                sum = 0
            }
            sum += num
            mx = max(sum, mx)
        }
        return mx
    }
}
