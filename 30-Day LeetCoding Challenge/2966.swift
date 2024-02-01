//
//  2966.swift
//  Leetcode
//
//  Created by polaris dev on 2024/2/1.
//

import Foundation

class Solution2966 {
    func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        guard !nums.isEmpty, nums.count % 3 == 0 else { return [] }
        let nums = nums.sorted()
        var rs: [[Int]] = []
        for i in 0..<(nums.count / 3) {
            if (nums[3 * i + 2] - nums[3 * i]) > k {
                return []
            }
            rs.append([nums[3 * i], nums[3 * i + 1], nums[3 * i + 2]])
        }
        return rs
    }
    
    func test() {
        print(divideArray([1,3,4,8,7,9,3,5,1], 2))
        print(divideArray([1,3,3,2,7,3], 3))
    }
}
