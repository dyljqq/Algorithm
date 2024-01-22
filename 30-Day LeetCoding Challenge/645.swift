//
//  645.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/22.
//

import Foundation

class Solution645 {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var dup = -1, sum = 0, nums = nums
        for i in 0..<nums.count {
            if nums[abs(nums[i]) - 1] < 0 {
                dup = abs(nums[i])
            } else {
                nums[abs(nums[i]) - 1] *= -1
            }
            sum += i + 1 - abs(nums[i])
        }
        return [dup, sum + dup]
    }
    
    func test() {
        print(findErrorNums([1,2,2,4]))
    }
}
