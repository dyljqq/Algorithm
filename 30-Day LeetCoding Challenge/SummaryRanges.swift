//
//  SummaryRanges.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/9.
//

import Foundation

class SummaryRanges {
    
    func summaryRanges(_ nums: [Int]) -> [String] {
        var rs: [String] = []
        guard !nums.isEmpty else {
            return rs
        }
        var start = nums[0], p = nums[0]
        
        for num in nums.dropFirst() {
            if num - p == 1 {
                p = num
            } else {
                rs.append(p == start ? "\(start)" : "\(start)->\(p)")
                start = num
                p = num
            }
        }
        rs.append(p == start ? "\(start)" : "\(start)->\(p)")
        return rs
    }
    
    func test() {
        print(summaryRanges([0,1,2,4,5,7]))
        print(summaryRanges([0,2,3,4,6,8,9]))
    }
    
}
