//
//  ContainsDuplicateII.swift
//  Leetcode
//
//  Created by 季勤强 on 2021/10/16.
//

import Foundation

class ContainsDuplicateII {
    
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var hash: [Int: Int] = [:]
        for (index, num) in nums.enumerated() {
            if let value = hash[num], (index - value) <= k {
                return true
            }
            hash[num] = index
        }
        return false
    }
    
    func test() {
        print(containsNearbyDuplicate([1,2,3,1,2,3], 2))
    }
    
}
