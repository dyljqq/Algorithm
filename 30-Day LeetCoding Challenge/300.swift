//
//  300.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/5.
//

import Foundation

class Solution300 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating: 0, count: nums.count)
        var len = 0
        for i in 0..<nums.count {
            var p = 0, q = len
            while p < q {
                let mid = (p + q) / 2
                if dp[mid] < nums[i] {
                    p = mid + 1
                } else {
                    q = mid
                }
            }
            dp[p] = nums[i]
            if len == p {
                len += 1
            }
        }
        return len
    }
    
    func test() {
        print(lengthOfLIS([10,9,2,5,3,7,101,18]))
        print(lengthOfLIS([0,1,0,3,2,3]))
        print(lengthOfLIS([7,7,7,7,7,7,7]))
        print(lengthOfLIS([4,10,4,3,8,9]))
    }
}
