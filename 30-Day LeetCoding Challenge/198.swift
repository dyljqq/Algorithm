//
//  198.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/12/1.
//

import Foundation

class Leetcode198 {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        var ans = 0
        for index in 0..<nums.count {
            if index == 0 {
                dp[index] = nums[index]
            } else if index == 1 {
                dp[index] = max(dp[0], nums[index])
            } else {
                dp[index] = max(dp[index - 2] + nums[index], dp[index - 1])
            }
            ans = max(dp[index], ans)
        }
        return ans
    }
    
    func test() {
        print(rob([1,2,3,1]))
        print(rob([2,7,9,3,1]))
        print(rob([0]))
        print(rob([1,3,1]))
        print(rob([2,1,1,2]))
    }
}
