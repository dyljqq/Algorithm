//
//  JumpGameII.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/20.
//

import Foundation

class JumpGameII {
    
    func jump(_ nums: [Int]) -> Int {
        var step = 0
        var end = 0
        var maxPosition = -1
        
        for (index, num) in nums.dropLast().enumerated() {
            maxPosition = max(maxPosition, index + num)
            if index == end {
                end = maxPosition
                step += 1
            }
        }
        return step
    }
    
    func test() {
        print(jump([2,3,1,1,4]))
    }
    
}
