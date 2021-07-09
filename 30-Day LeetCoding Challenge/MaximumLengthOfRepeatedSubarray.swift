//
//  MaximumLengthOfRepeatedSubarray.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/9.
//

import Foundation

class MaximumLengthOfRepeatedSubarray {
    
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var res = 0
        var dp = Array(repeating: Array(repeating: 0, count: nums2.count + 1), count: nums1.count + 1)
        
        for i in 1...nums1.count {
            for j in 1...nums2.count {
                dp[i][j] = nums1[i - 1] == nums2[j - 1] ? dp[i - 1][j - 1] + 1 : 0
                res = max(res, dp[i][j])
            }
        }
        return res
    }
    
    func test() {
        
        print(findLength([1,2,3,2,1], [3,2,1,4,7]))
        print(findLength([0,0,0,0,0], [0,0,0,0,0]))
        print(findLength([0,0,0,0,1], [1,0,0,0,0]))
        
    }
    
}
