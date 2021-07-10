//
//  LongestIncreasingSubsequence.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/10.
//

import Foundation

class LongestIncreasingSubsequence {
    
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int] = []
        for num in nums {
            if dp.isEmpty || num > dp.last! {
                dp.append(num)
            } else if num < dp.last! {
                let index = lowerBounds(num, dp)
                dp[index] = num
            }
        }
        return dp.count
    }
    
    func lowerBounds(_ num: Int, _ dp: [Int]) -> Int {
        var left = 0, right = dp.count
        while left < right {
            let mid = (left + right) / 2
            if num < dp[mid] {
                right = mid
            } else if num > dp[mid] {
                left = mid + 1
            } else {
                return mid
            }
        }
        return left
    }
    
    func test() {
//        print(lengthOfLIS([10,9,2,5,3,7,101,18]))
//        print(lengthOfLIS([0,1,0,3,2,3]))
//        print(lengthOfLIS([7,7,7,7,7,7,7]))
        print(lengthOfLIS([4,10,4,3,8,9]))
    }
    
}
