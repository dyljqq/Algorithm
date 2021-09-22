//
//  MaxConsecutiveOnes.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/9/22.
//

import Foundation

class MaxConsecutiveOnes {
    
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        var maxConsecutive = 0
        var currentConsecutive = 0
        
        for num in nums {
            if num == 1 {
                currentConsecutive += 1
            } else {
                maxConsecutive = max(maxConsecutive, currentConsecutive)
                currentConsecutive = 0
            }
        }
        return max(maxConsecutive, currentConsecutive)
    }
    
    func test() {
        print(findMaxConsecutiveOnes([1,1,0,1,1,1]))
        print(findMaxConsecutiveOnes([1,0,1,1,0,1]))
    }
    
}
