//
//  930.swift
//  Leetcode
//
//  Created by polaris dev on 2024/3/14.
//

import Foundation

class Solution930 {
    func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
        var hash: [Int: Int] = [:]
        var sum = 0, ret = 0
        for num in nums {
            hash[sum] = hash[sum, default: 0] + 1
            sum += num
            ret += hash[sum - goal, default: 0]
        }
        return ret
    }
    
    func test() {
        print(numSubarraysWithSum([1,0,1,0,1], 2))
    }
}
