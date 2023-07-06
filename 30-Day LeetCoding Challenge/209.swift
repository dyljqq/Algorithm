//
//  209.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/6.
//

import Foundation

class Solution209 {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var left = 0, right = 0, sum = 0
        var mn = Int.max
        while right < nums.count {
            while sum < target && right < nums.count {
                sum += nums[right]
                right += 1
            }
            while sum >= target {
                mn = min(mn, right - left)
                sum -= nums[left]
                left += 1
            }
        }
        return mn == Int.max ? 0 : mn
    }
    
    func test() {
        print(minSubArrayLen(7, [2,3,1,2,4,3]))
        print(minSubArrayLen(4, [1, 4, 4]))
        print(minSubArrayLen(11, [1,1,1,1,1,1,1,1]))
    }
}
