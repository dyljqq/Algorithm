//
//  413.swift
//  Leetcode
//
//  Created by 季勤强 on 2022/3/3.
//

import Foundation

class Leetcode413 {
    
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        var cur = 0, res = 0
        for i in 2..<nums.count {
            if (nums[i] - nums[i - 1]) == (nums[i - 1] - nums[i - 2]) {
                cur += 1
                res += cur
            } else {
                cur = 0
            }
        }
        return res
    }
    
    func test() {
        print(numberOfArithmeticSlices([1,2,3,4]))
    }
    
}
