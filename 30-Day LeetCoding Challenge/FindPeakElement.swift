//
//  FindPeakElement.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/7/14.
//

import Foundation

class FindPeakElement {
    
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var left = 0, right = nums.count - 1
        while left < right {
            let mid = (left + right) / 2
            if nums[mid] > nums[mid + 1] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    func test() {
//        print(findPeakElement(Array(0..<10)))
//        print(findPeakElement(Array(0..<10).reversed()))
//        print(findPeakElement([1]))
//        print(findPeakElement([1,2,3,1]))
        print(findPeakElement([1,2,1,3,5,6,4]))
        print(findPeakElement([2,1]))
    }
    
}
