//
//  486.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/28.
//

import Foundation

class Solution486 {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)
        for i in 0..<nums.count {
            dp[i][i] = nums[i]
        }
        
        for j in 1..<nums.count {
            for i in stride(from: j - 1, to: -1, by: -1) {
                dp[i][j] = max(nums[i] - dp[i + 1][j], nums[j] - dp[i][j - 1])
            }
        }
        
        return dp[0][nums.count - 1] >= 0
    }
    
    func test() {
        print(PredictTheWinner([1,5,2]))
    }
}
