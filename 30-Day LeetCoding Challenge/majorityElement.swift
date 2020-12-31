//
//  MajorityElement.swift
//  Leetcode
//
//  Created by 季勤强 on 2020/12/31.
//

import Foundation

class MajorityElement{
    
    func majorityElement(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        
        var value = nums[0]
        var count = 1
        for i in 1..<nums.count {
            if value == nums[i] {
                count += 1
            } else {
                count -= 1
                if count == 0 {
                    value = nums[i]
                    count = 1
                }
            }
        }
        return value
    }
    
}
