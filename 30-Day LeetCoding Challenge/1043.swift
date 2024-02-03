//
//  1043.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/3.
//

import Foundation

class Solution1043 {
    func maxSumAfterPartitioning(_ arr: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: 0, count: arr.count + 1)
        for i in 1...arr.count {
            var mx = 0
            for j in 1...k {
                guard i - j >= 0 else { break }
                mx = max(mx, arr[i - j])
                dp[i] = max(dp[i], dp[i - j] + mx * j)
            }
        }
        return dp[arr.count]
    }
    
    func test() {
        print(maxSumAfterPartitioning([1,15,7,9,2,5,10], 3))
        print(maxSumAfterPartitioning([1,4,1,5,7,3,6,1,9,9,3], 4))
        print(maxSumAfterPartitioning([1], 1))
    }
}
