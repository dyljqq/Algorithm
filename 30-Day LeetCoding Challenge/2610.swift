//
//  2610.swift
//  Leetcode
//
//  Created by polaris dev on 2024/1/2.
//

import Foundation

class Solution2610 {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var hash: [Int: Int] = [:]
        var mx = -1
        nums.forEach { num in
            hash[num, default: 0] += 1
            mx = max(hash[num, default: 0], mx)
        }
        var rs: [[Int]] = []
        for _ in 0..<mx {
            var r: [Int] = []
            for key in hash.keys {
                if let value = hash[key], value > 0 {
                    r.append(key)
                    hash[key, default: 0] -= 1
                }
            }
            rs.append(r)
        }
        return rs
    }
    
    func test() {
        print(findMatrix([1,3,4,1,2,3,1]))
        print(findMatrix([1,2,3,4]))
    }
}
