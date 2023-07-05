//
//  1493.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/5.
//

import Foundation

// https://leetcode.com/problems/longest-subarray-of-1s-after-deleting-one-element/description/
class Solution1493 {
    func longestSubarray(_ nums: [Int]) -> Int {
        var rs: [Int] = [0]
        for num in nums {
            if num == 0 {
                rs.append(0)
            } else {
                rs[rs.count - 1] += 1
            }
        }
        
        var mx: Int = rs[0]
        for index in 1..<rs.count {
            mx = max(mx, rs[index] + rs[index - 1])
        }
        
        return rs[0] == nums.count ? (rs[0] - 1) : mx
    }
    
    func test() {
        print(longestSubarray([1,1,0,1]))
        print(longestSubarray([0,1,1,1,0,1,1,0,1]))
        print(longestSubarray([1,1,1]))
    }
}
