//
//  35.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/11/26.
//

import Foundation

class leetcode35 {
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        
        if nums.last! < target {
            return nums.count
        } else if nums.first! > target {
            return 0
        }
        
        var p = 0, q = nums.count
        while p < q {
            let mid = (p + q) / 2
            if (nums[mid] == target) {
                return mid
            } else if (nums[mid] > target) {
                q = mid
            } else {
                p = mid + 1
            }
        }
        return p
    }
    
    func test() {
        print(searchInsert([1,3,5,6], 2))
        print(searchInsert([1,3,5,6], 7))
        print(searchInsert([1,3,5,6], 0))
        print(searchInsert([1], 0))
    }
    
}
