//
//  1218.swift
//  Leetcode
//
//  Created by polaris dev on 2023/7/14.
//

import Foundation

class Solution1218 {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var dp: [Int] = Array(repeating: 1, count: arr.count)
        var mx = 1
        
        for i in 1..<arr.count {
            for j in stride(from: i - 1, to: -1, by: -1) {
                if arr[i] - arr[j] == difference {
                    dp[i] = dp[j] + 1
                    mx = max(dp[i], mx)
                    break
                }
            }
        }
        return mx
    }
    
    func test() {
        print(longestSubsequence([1,2,3,4], 1))
        print(longestSubsequence([1,3,5,7], 1))
        print(longestSubsequence([1,5,7,8,5,3,4,2,1], -2))
    }
}
