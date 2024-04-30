//
//  560.swift
//  Leetcode
//
//  Created by polaris dev on 2024/4/30.
//

import Foundation

//Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.
//
//A subarray is a contiguous non-empty sequence of elements within an array.

class Solution560 {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var hash: [Int: Int] = [:], prefix = 0, cnt = 0
        hash[0] = 1
        for num in nums {
            prefix += num
            let target = prefix - k
            if let v = hash[target] {
                cnt += v
            }
            hash[prefix, default: 0] += 1
        }
        return cnt
    }
    
    func test() {
        print(subarraySum([1,1,1], 2))
        print(subarraySum([1,2,3], 3))
    }
}
