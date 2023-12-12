//
//  1464.swift
//  Leetcode
//
//  Created by polaris dev on 2023/12/12.
//

import Foundation

class Solution1464 {
    
    func maxProduct(_ nums: [Int]) -> Int {
        var elements: [Int] = Array(repeating: 0, count: 2)
        elements[0] = nums[0]
        if nums[1] > nums[0] {
            elements[0] = nums[1]
            elements[1] = nums[0]
        } else {
            elements[1] = nums[1]
        }
        for num in nums[2..<nums.count] {
            if let last = elements.last,
               num > last {
                if num > elements[0] {
                    let temp = elements[0]
                    elements[0] = num
                    elements[1] = temp
                } else {
                    elements[1] = num
                }
            }
        }
        return (elements[0] - 1) * (elements[1] - 1)
    }
    
    func test() {
        print(maxProduct([3,4,5,2]))
        print(maxProduct([1,5,4,5]))
        print(maxProduct([3,7]))
    }
}
