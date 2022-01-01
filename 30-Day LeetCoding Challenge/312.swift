//
//  312.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/1/1.
//

import Foundation

class Leetcode312 {
    /// 312. Burst Balloons
    /// https://leetcode.com/problems/burst-balloons
    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = Array(repeating: Array(repeating: 0, count: nums.count + 2), count: nums.count + 2)
        var nums = nums
        nums.insert(1, at: 0)
        nums.append(1)
        
        for l in 1...n {
            for i in 1...(n - l + 1) {
                let j = l + i - 1
                for k in i...j {
                    dp[i][j] = max(dp[i][j], dp[i][k - 1] + nums[i - 1] * nums[k] * nums[j + 1] + dp[k + 1][j])
                }
            }
        }
        return dp[1][n]
    }
    
    func test() {
        print(maxCoins([3,1,5,8]))
    }
}
