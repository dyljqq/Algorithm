//
//  singleElementInSortedArray.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/1/7.
//

import Foundation

class SingleElementInSortedArray {
//    func singleNonDuplicate(_ nums: [Int]) -> Int {
//        guard !nums.isEmpty else {
//            return 0
//        }
//
//        var nums = nums
//        nums.append(Int.max)
//        nums.insert(Int.max, at: 0)
//
//        for i in 1..<(nums.count - 1) {
//            if nums[i] != nums[i - 1] && nums[i] != nums[i + 1] {
//                return nums[i]
//            }
//        }
//
//        return 0
//    }
    
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count
        
        while l < r {
            let m = l + (r - l) / 2
            let n = m ^ 1 // m ^ 1: m % 2 == 0 ? m + 1 : m - 1
            if nums[n] == nums[m] {
                l = m + 1
            } else {
                r = m
            }
        }
        
        return nums[l]
    }
    
    func test() {
        print(singleNonDuplicate([1,1,2,3,3,4,4,8,8]))
        print(singleNonDuplicate([3,3,7,7,10,11,11]))
    }
}
