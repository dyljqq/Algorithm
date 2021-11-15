//
//  368.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/15.
//

import Foundation

// https://leetcode.com/problems/largest-divisible-subset/
class Leetcode368 {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        var mx = 0, mxIdx = 0
        var dp = Array(repeating: 0, count: nums.count)
        var parents = Array(repeating: -1, count: nums.count)
        let nums = nums.sorted()

        for i in 0..<nums.count {
            for j in stride(from: i - 1, to: -1, by: -1) {
                if nums[i] % nums[j] == 0 && (dp[j] + 1) > dp[i] {
                    parents[i] = j
                    dp[i] = dp[j] + 1
                    if dp[i] > mx {
                        mx = dp[i]
                        mxIdx = i
                    }
                }
            }
        }
        
        if mx == 0 {
            return [nums[0]]
        }
        
        var res = [Int]()
        while mxIdx != -1 {
            res.append(nums[mxIdx])
            mxIdx = parents[mxIdx]
        }
        return res
    }
    
    func test() {
        print(largestDivisibleSubset([1, 2, 3]))
        print(largestDivisibleSubset([1,2,4,8]))
    }
}
