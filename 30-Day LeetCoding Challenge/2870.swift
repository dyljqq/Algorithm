//
//  2870.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/4.
//

import Foundation

class Solution2870 {
    func minOperations(_ nums: [Int]) -> Int {
        var hash: [Int: Int] = [:]
        nums.forEach { hash[$0, default: 0] += 1 }
        
        var total = 0
        for value in hash.values {
            if value == 1 {
                return -1
            }
            let remain = value % 6
            if remain > 0 {
                total += remain > 3 ? 2 : 1
            }
            total += 2 * (value / 6)
        }
        return total
    }
    
    func test() {
//        print(minOperations([2,3,3,2,2,4,2,3,4]))
//        print(minOperations([2,1,2,2,3,3]))
        print(minOperations([3,14,3,14,3,14,14,3,3,14,14,14,3,14,14,3,14,14,14,3]))
    }
}
